# frozen_string_literal: true

module SubscriptionPayment
  module Providers
    module Braintree
      class Address
        extend T::Sig

        sig do
          params(
            gateway: ::Braintree::Gateway,
            credit_card: SubscriptionPayment::Entity::Address
          ).returns(SubscriptionPayment::Entity::Address)
        end
        def create(gateway:, credit_card:)
          result = gateway.credit_card.create(credit_card)
        end

        sig do
          params(
            gateway: ::Braintree::Gateway,
            credit_card: SubscriptionPayment::Entity::Address
          ).returns(SubscriptionPayment::Entity::Address)
        end
        def update(gateway:, credit_card:)

        end

        sig do
          params(
            gateway: ::Braintree::Gateway,
            address_id: String
          ).returns(SubscriptionPayment::Entity::Address)
        end
        def find(gateway:, address_id:)
          address = gateway.address.find(address_id)
          to_address(address)
        end

        private

        def to_address(from)
          hash_fields = {
            street_address: from.street_address,
            locality: from.locality,
            region: from.region,
            postal_code: from.postal_code,
            extended_address: from.extended_address,
            id: from.id
          }
          SubscriptionPayment::Entity::Address.new(**hash_fields)
        end
      end
    end
  end
end
