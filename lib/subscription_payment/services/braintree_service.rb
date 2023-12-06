# frozen_string_literal: true

module SubscriptionPayment
  module Services
    class BraintreeService
      extend T::Sig
      extend SubscriptionPayment::Interfaces

      def initialize
        environment = ENV["BRAINTREE_ENV"]
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
        service = SubscriptionPayment::Providers::Braintree::Customer.new
        result = service.create(gateway: @provider.gateway, customer: customer)
        customer.id = result.customer.id
        customer.credit_card_token = result.customer.payment_methods[0].token
        return customer
      end

      def create_payment_method_nonce(credit_card_token)
        service = SubscriptionPayment::Providers::Braintree::CreditCardToken.new
        service.create_payment_method_nonce(gateway: @provider.gateway, credit_card_token: credit_card_token)
      end

      def create_subscription(payment_method_nonce_token, plan_id)
        service = SubscriptionPayment::Providers::Braintree::Subscription.new
        result = service.create(gateway: @provider.gateway, payment_method_nonce_token: payment_method_nonce_token , plan_id: plan_id)
        result.subscription.id
      end
    end
  end
end
