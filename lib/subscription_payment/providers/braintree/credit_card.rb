# frozen_string_literal: true

module SubscriptionPayment
  module Providers
    module Braintree
      class CreditCard < SubscriptionPayment::Providers::Braintree::Base
        extend T::Sig

        sig do
          params(
            token: String
          ).returns(SubscriptionPayment::Entity::CreditCard)
        end
        def find(token:)
          credit_card = gateway.credit_card.find(token)
          to_credit_card(credit_card)
        end

        sig do
          params(
            credit_card: SubscriptionPayment::Entity::CreditCard
          ).returns(SubscriptionPayment::Entity::CreditCard)
        end
        def create(credit_card:)
          payload = {
            customer_id: credit_card.customer_id,
            cardholder_name: credit_card.holder_name,
            number: credit_card.number,
            expiration_date: credit_card.expiration_date,
            cvv: credit_card.cvv,
            options: {
              make_default: true,
              verify_card: true
            }
          }
          result = gateway.credit_card.create(payload)
          to_credit_card(result.credit_card)
        end

        sig do
          params(
            credit_card: SubscriptionPayment::Entity::CreditCard
          ).returns(SubscriptionPayment::Entity::CreditCard)
        end
        def update(credit_card:)
          payload = {
            cardholder_name: credit_card.holder_name,
            number: credit_card.number,
            expiration_date: credit_card.expiration_date,
            cvv: credit_card.cvv,
          }

          payload[:billing_address_id] = credit_card.address_id unless credit_card.address_id.nil?

          result = gateway.credit_card.update(credit_card.token, payload)
          to_credit_card(result.credit_card)
        end

        sig do
          params(
            token: String
          ).returns(String)
        end
        def create_nonce(token:)
          result = gateway.payment_method_nonce.create(token)
          result.payment_method_nonce.nonce
        end

        private

        def to_credit_card(from)
          hash_fields = {
            customer_id: from.customer_id,
            holder_name: from.cardholder_name,
            number: "#{from.bin}**#{from.last_4}",
            expiration_date: "#{from.expiration_month}/#{from.expiration_year}",
            cvv: "***",
            token: from.token
          }
          hash_fields[:address_id] = from.billing_address.id unless from.billing_address.nil?

          SubscriptionPayment::Entity::CreditCard.new(**hash_fields)
        end
      end
    end
  end
end
