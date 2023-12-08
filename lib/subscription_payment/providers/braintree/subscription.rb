# frozen_string_literal: true

module SubscriptionPayment
  module Providers
    module Braintree
      class Subscription < SubscriptionPayment::Providers::Braintree::Base
        extend T::Sig

        sig do
          params(
            id: String
          ).returns(SubscriptionPayment::Entity::Subscription)
        end
        def find(id:)
          subscription = gateway.subscription.find(id)
          to_subscription(subscription)
        end

        sig do
          params(
            payment_method_nonce: String,
            plan_id: String,
          ).returns(SubscriptionPayment::Entity::Subscription)
        end
        def create(payment_method_nonce:, plan_id:)
          result = gateway.subscription.create(payment_method_nonce: payment_method_nonce, plan_id: plan_id)
          to_subscription(result.subscription)
        end

        sig do
          params(
            id: String,
            payment_method_nonce: String
          ).returns(SubscriptionPayment::Entity::Subscription)
        end
        def update(id:, payment_method_nonce:)
          result = gateway.subscription.update(id, payment_method_nonce: payment_method_nonce)
          to_subscription(result.subscription)
        end

        sig do
          params(
            id: String
          ).returns(SubscriptionPayment::Entity::Subscription)
        end
        def cancel(id:)
          result = gateway.subscription.cancel(id)
          to_subscription(result.subscription)
        end

        sig do
          params(
            id: String
          ).returns(SubscriptionPayment::Entity::Subscription)
        end
        def retry_charge(id:)
          result = gateway.subscription.retry_charge(id, nil, true)
          puts result.inspect
          to_subscription(result.subscription)
        end
      end
    end
  end
end
  