# frozen_string_literal: true

module SubscriptionPayment
  module Entity
    class BillingAddress
      extend T::Sig

      sig { returns(String) }
      attr_accessor :street_address, :locality, :region, :postal_code, :extended_address

      sig do
        params(
          street_address: String,
          locality: String,
          region: String,
          postal_code: String,
          extended_address: String
        ).void
      end
      def initialize(street_address:, locality:, region:, postal_code:, extended_address:)
        @street_address = street_address
        @locality = locality
        @region = region
        @postal_code = postal_code
        @extended_address = extended_address
      end
    end
  end
end
