# frozen_string_literal: true

module SubscriptionPayment
  module Providers
    module Braintree
      class Address < SubscriptionPayment::Providers::Braintree::Base
        extend T::Sig

        sig do
          params(
            id: String,
            customer_id: String
          ).returns(SubscriptionPayment::Entity::Address)
        end
        def find(id:, customer_id:)
          address = gateway.address.find(customer_id, id)
          to_address(address)
        end

        sig do
          params(
            address: SubscriptionPayment::Entity::Address
          ).returns(SubscriptionPayment::Entity::Address)
        end
        def create(address:)
          payload = {
            customer_id: address.customer_id,
            street_address: address.street_address,
            locality: address.locality,
            region: address.region,
            postal_code: address.postal_code,
            extended_address: address.extended_address
          }

          result = gateway.address.create(payload)
          to_address(result.address)
        end

        sig do
          params(
            address: SubscriptionPayment::Entity::Address
          ).returns(SubscriptionPayment::Entity::Address)
        end
        def update(address:)
          payload = {
            street_address: address.street_address,
            locality: address.locality,
            region: address.region,
            postal_code: address.postal_code,
            extended_address: address.extended_address
          }

          result = gateway.address.update(address.customer_id, address.id, payload)
          to_address(result.address)
        end

        private

        def to_address(from)
          SubscriptionPayment::Entity::Address.new(
            customer_id: from.customer_id,
            street_address: from.street_address,
            locality: from.locality,
            region: from.region,
            postal_code: from.postal_code,
            extended_address: from.extended_address,
            id: from.id
          )
        end
      end
    end
  end
end
