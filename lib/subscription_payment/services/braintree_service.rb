# frozen_string_literal: true

module SubscriptionPayment
  module Services
    class BraintreeService
      extend T::Sig
      extend SubscriptionPayment::Interfaces

      def initialize
        environment = ENV["BRAINTREE_ENVIRONMENT"]
        merchant_id = ENV["BRAINTREE_MERCHANT_ID"]
        public_key = ENV["BRAINTREE_PUBLIC_KEY"]
        private_key = ENV["BRAINTREE_PRIVATE_KEY"]

        @provider = SubscriptionPayment::Providers::Braintree::Gateway.new(
          environment: environment,
          merchant_id: merchant_id,
          public_key: public_key,
          private_key: private_key
        )
      end

      def create_plan(plan)
        service = SubscriptionPayment::Providers::Braintree::Plan.new
        response = service.create(gateway: @provider.gateway, plan: plan)
        plan.id = response.plan.id
      end

      def find_plan(plan_id)
        service = SubscriptionPayment::Providers::Braintree::Plan.new
        service.find(gateway: @provider.gateway, plan_id: plan_id)
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
