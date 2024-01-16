# frozen_string_literal: true

module SubscriptionPaymentApi
  module Providers
    module Braintree
      class Webhook < SubscriptionPaymentApi::Providers::Braintree::Base
        extend T::Sig

        sig do
          params(
            bt_signature: String,
            bt_payload: String
          ).returns(SubscriptionPaymentApi::Entity::Webhook)
        end
        def parse(bt_signature:, bt_payload:)
          result = gateway.webhook_notification.parse(
            bt_signature,
            bt_payload.gsub(" ", "\n")
          )

          webhook = SubscriptionPaymentApi::Entity::Webhook.new(kind: result.kind)
          webhook.subscription = to_subscription(result.subscription, 'internal')\
            unless result.subscription.nil?

          webhook
        rescue => e
          raise SubscriptionPaymentApi::Exceptions::GeneralError.new(e.message)
        end
      end
    end
  end
end
