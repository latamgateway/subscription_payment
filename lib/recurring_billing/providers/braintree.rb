module RecurringBilling
  module Providers
    class Braintree
      def initialize(environment:, merchant_id:, public_key:, private_key:)
        @environment = environment
        @merchant_id = merchant_id
        @public_key = public_key
        @private_key = private_key
      end

      def gateway
        ::Braintree::Gateway.new(
          :environment => @environment,
          :merchant_id => @merchant_id,
          :public_key => @public_key,
          :private_key => @private_key,
        )
      end
    end
  end
end

