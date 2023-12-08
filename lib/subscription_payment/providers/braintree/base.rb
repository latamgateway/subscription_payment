# frozen_string_literal: true

module SubscriptionPayment
  module Providers
    module Braintree
      class Base
        def initialize
          @environment = ENV["BRAINTREE_ENV"]
          @merchant_id = ENV["BRAINTREE_MERCHANT_ID"]
          @public_key = ENV["BRAINTREE_PUBLIC_KEY"]
          @private_key = ENV["BRAINTREE_PRIVATE_KEY"]
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
