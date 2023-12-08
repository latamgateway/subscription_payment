# frozen_string_literal: true

module SubscriptionPayment
  module Providers
    module Braintree
      class CreditCard
        extend T::Sig

        sig do
          params(
            gateway: ::Braintree::Gateway,
            token: String
          ).returns(String)
        end
        def create_nonce(gateway:, token:)
          result = gateway.payment_method_nonce.create(credit_card_token)
          result.payment_method_nonce.nonce
        end

        sig do
          params(
            gateway: ::Braintree::Gateway,
            credit_card: SubscriptionPayment::Entity::CreditCard
          ).returns(SubscriptionPayment::Entity::CreditCard)
        end
        def create(gateway:, credit_card:)
          result = gateway.credit_card.create(credit_card)
        end

        sig do
          params(
            gateway: ::Braintree::Gateway,
            credit_card: SubscriptionPayment::Entity::CreditCard
          ).returns(SubscriptionPayment::Entity::CreditCard)
        end
        def update(gateway:, credit_card:)

        end

        sig do
          params(
            gateway: ::Braintree::Gateway,
            token: String
          ).returns(SubscriptionPayment::Entity::CreditCard)
        end
        def find(gateway:, token:)
          puts "Aqui 3"
          credit_card = gateway.credit_card.find(token)
          to_credit_card(credit_card)
        end

        private

        def to_credit_card(from)
          puts "Aqui 4"
          puts from
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
