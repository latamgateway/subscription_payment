module RecurringBilling
  module Interfaces
    class BraintreeService < RecurringBilling::Interfaces::RecurringBillingService
      extend T::Sig

      def initialize
        environment = ENV['BRAINTREE_ENVIRONMENT']
        merchant_id = ENV['BRAINTREE_MERCHANT_ID']
        public_key = ENV['BRAINTREE_PUBLIC_KEY']
        private_key = ENV['BRAINTREE_PRIVATE_KEY']

        puts environment
        puts merchant_id
        puts public_key
        puts private_key

        @braintree = RecurringBilling::Providers::Braintree.new(
          environment: environment,
          merchant_id: merchant_id,
          public_key: public_key,
          private_key: private_key
        )

        puts @braintree
        @gateway = @braintree.gateway
        puts @gateway
        @gateway
      end

      def create_plan(plan)
        gateway_plan = @gateway.plan.create(plan)
        plan.id = gateway_plan.id
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
