module RecurringBilling
  module Services
    class BraintreeService < RecurringBilling::Interfaces::BaseInterface
      extend T::Sig

      def initialize
        environment = ENV['BRAINTREE_ENVIRONMENT']
        merchant_id = ENV['BRAINTREE_MERCHANT_ID']
        public_key = ENV['BRAINTREE_PUBLIC_KEY']
        private_key = ENV['BRAINTREE_PRIVATE_KEY']

        @gateway = RecurringBilling::Providers::Braintree.new(
          environment: environment,
          merchant_id: merchant_id,
          public_key: public_key,
          private_key: private_key
        )
      end

      def create_plan(plan)
        gateway_plan = @gateway.create_plan(plan)
        plan.id = gateway_plan.plan.id
      end

      def create_customer(customer)
        gateway_customer = @gateway.create_customer(customer)
        customer.id = gateway_customer.id
      end

      def create_payment_method_nonce(credit_card_token)
        @gateway.create_payment_method_nonce(credit_card_token)
      end

      def create_subscription(credit_card_token, plan_id)
        @gateway.subscription.create(credit_card_token, plan_id)
      end

    end
  end
end
