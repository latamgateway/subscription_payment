module RecurringBilling
  module Providers
    class Braintree
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

      sig { returns(::Braintree::Gateway) }
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

