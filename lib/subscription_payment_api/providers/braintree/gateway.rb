# frozen_string_literal: true

module SubscriptionPaymentApi
  module Providers
    module Braintree
      class Gateway
        extend T::Sig

        sig { returns(String) }
        attr_accessor :environment, :merchant_id, :public_key, :private_key

        sig do
          params(
            environment: String,
            merchant_id: String,
            public_key: String,
            private_key: String
          ).void
        end
        def initialize(environment:, merchant_id:, public_key:, private_key:)
          @environment = environment
          @merchant_id = merchant_id
          @public_key = public_key
          @private_key = private_key
        end

        def gateway
          ::Braintree::Gateway.new(
            environment: @environment,
            merchant_id: @merchant_id,
            public_key: @public_key,
            private_key: @private_key
          )
        end
      end
    end
  end
end
