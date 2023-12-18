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
        rescue => e
          raise SubscriptionPayment::Exceptions::GeneralError.new(e.message)
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
          response = gateway.credit_card.create(payload)

          raise SubscriptionPayment::Exceptions::GeneralError.new(response.message) \
            unless response.success?

          to_credit_card(response.credit_card)
        end

        sig do
          params(
            credit_card: SubscriptionPayment::Entity::CreditCard
          ).returns(SubscriptionPayment::Entity::CreditCard)
        end
        def update(credit_card:)
          payload = {
            billing_address_id: credit_card.address_id
          }

          response = gateway.credit_card.update(credit_card.token, payload)

          raise SubscriptionPayment::Exceptions::GeneralError.new(response.message) \
            unless response.success?

          to_credit_card(response.credit_card)
        end

        sig do
          params(
            token: String
          ).returns(String)
        end
        def create_nonce(token:)
          response = gateway.payment_method_nonce.create(token)

          raise SubscriptionPayment::Exceptions::GeneralError.new(response.message) \
            unless response.success?

          response.payment_method_nonce.nonce
        end
      end
    end
  end
end
