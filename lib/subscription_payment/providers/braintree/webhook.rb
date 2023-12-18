# frozen_string_literal: true

module SubscriptionPayment
  module Providers
    module Braintree
      class Webhook < SubscriptionPayment::Providers::Braintree::Base
        extend T::Sig

        sig do
          params(
            bt_signature: String,
            bt_payload: String
          ).returns(SubscriptionPayment::Entity::Webhook)
        end
        def parse(bt_signature:, bt_payload:)
          result = gateway.webhook_notification.parse(
            bt_signature,
            bt_payload.gsub(" ", "\n")
          )

          webhook = SubscriptionPayment::Entity::Webhook.new(kind: result.kind)
          webhook.subscription = to_subscription(result.subscription)\
            unless result.subscription.nil?

          webhook
        rescue => e
          raise SubscriptionPayment::Exceptions::GeneralError.new(e.message)
        end
      end
    end
  end
end
