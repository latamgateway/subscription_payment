# frozen_string_literal: true

module SubscriptionPaymentApi
  module Entity
    class Address
      extend T::Sig

      sig { returns(String) }
      attr_accessor :street_address, :locality, :region, :postal_code, :extended_address, :customer_id, :id

      sig do
        params(
          customer_id: String,
          street_address: String,
          locality: String,
          region: String,
          postal_code: String,
          extended_address: String,
          id: T.nilable(String)
        ).void
      end
      def initialize(customer_id:, street_address:, locality:, region:, postal_code:, extended_address:, id: nil)
        @customer_id = customer_id
        @street_address = street_address
        @locality = locality
        @region = region
        @postal_code = postal_code
        @extended_address = extended_address
        @id = id
      end
    end
  end
end
