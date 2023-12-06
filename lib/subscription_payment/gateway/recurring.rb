# frozen_string_literal: true

module SubscriptionPayment
  module Gateway
    class Recurring
      extend T::Sig

      def initialize
        @service = SubscriptionPayment::Factories::Factory.new.service
      end

      # sig do
      #   params(plan: SubscriptionPayment::Entity::Plan)
      #     .returns(::Braintree::SuccessfulResult)
      # end
      def create_plan(plan)
        @service.create_plan(plan)
      end

      def find_plan(plan_id)
        @service.find_plan(plan_id)
      end

      def create_customer(customer)
        @service.create_customer(customer)
      end

      def create_payment_method_nonce(credit_card_token)
        @service.create_payment_method_nonce(credit_card_token)
      end

      def create_subscription(payment_method_nonce_token, plan_id)
        @service.create_subscription(payment_method_nonce_token, plan_id)
      end

      # def initialize
      #   @environment = ENV['BRAINTREE_ENVIRONMENT']
      #   @merchant_id = ENV['BRAINTREE_MERCHANT_ID']
      #   @public_key = ENV['BRAINTREE_PUBLIC_KEY']
      #   @private_key = ENV['BRAINTREE_PRIVATE_KEY']

      #   @gateway = SubscriptionPayment::Providers::Braintree.new(
      #     environment: @environment,
      #     merchant_id: @merchant_id,
      #     public_key: @public_key,
      #     private_key: @private_key
      #   ).gateway
      # end

      # sig do
      #   params(plan: SubscriptionPayment::Entity::Plan)
      #     .returns(::Braintree::SuccessfulResult)
      # end
      # def create_plan(plan)
      #   @gateway.plan.create(
      #     :name => plan.name,
      #     :billing_frequency => plan.frequency,
      #     :currency_iso_code => plan.currency,
      #     :price => plan.price
      #   )
      # end
    end
  end
end
