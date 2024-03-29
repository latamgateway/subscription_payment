# frozen_string_literal: true

module SubscriptionPaymentApi
  module Providers
    module Braintree
      class Subscription < SubscriptionPaymentApi::Providers::Braintree::Base
        extend T::Sig

        sig do
          params(
            id: String,
            destination: T.nilable(String)
          ).returns(SubscriptionPaymentApi::Entity::Subscription)
        end
        def find(id:, destination: 'internal')
          subscription = gateway.subscription.find(id)
          to_subscription(subscription, destination)
        rescue => e
          raise SubscriptionPaymentApi::Exceptions::GeneralError.new(e.message)
        end

        sig do
          params(
            id: String,
            payment_method_nonce: String,
            plan_id: String,
          ).returns(SubscriptionPaymentApi::Entity::Subscription)
        end
        def create(id:, payment_method_nonce:, plan_id:)
          merchant_id = ENV["BRAINTREE_ACCOUNT_ID"]

          payload = {
            id: id, payment_method_nonce: payment_method_nonce, plan_id: plan_id
          }

          payload[:merchant_account_id] = merchant_id unless merchant_id.nil?

          response = gateway.subscription.create(**payload)

          raise SubscriptionPaymentApi::Exceptions::GeneralError.new(response.message) \
            unless response.success?

          to_subscription(response.subscription, 'internal')
        end

        sig do
          params(
            id: String,
            payment_method_nonce: String
          ).returns(SubscriptionPaymentApi::Entity::Subscription)
        end
        def update(id:, payment_method_nonce:)
          merchant_id = ENV["BRAINTREE_ACCOUNT_ID"]

          payload = {
            payment_method_nonce: payment_method_nonce
          }

          payload[:merchant_account_id] = merchant_id unless merchant_id.nil?

          response = gateway.subscription.update(id, **payload)

          raise SubscriptionPaymentApi::Exceptions::GeneralError.new(response.message) \
            unless response.success?

          to_subscription(response.subscription, 'api')
        end

        sig do
          params(
            id: String
          ).returns(SubscriptionPaymentApi::Entity::Subscription)
        end
        def cancel(id:)
          response = gateway.subscription.cancel(id)

          raise SubscriptionPaymentApi::Exceptions::GeneralError.new(response.message) \
            unless response.success?

          to_subscription(response.subscription, 'api')
        end

        sig do
          params(
            id: String
          ).returns(SubscriptionPaymentApi::Entity::Subscription)
        end
        def retry_charge(id:)
          response = gateway.subscription.retry_charge(id, nil, true)

          raise SubscriptionPaymentApi::Exceptions::GeneralError.new(response.message) \
            unless response.success?

          to_subscription(response.subscription, 'internal')
        end
      end
    end
  end
end
  