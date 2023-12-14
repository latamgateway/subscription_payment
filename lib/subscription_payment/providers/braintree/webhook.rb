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
          ).returns(SubscriptionPayment::Entity::Subscription)
        end
        def parse(bt_signature:, bt_payload:)
          result = gateway.webhook_notification.parse(
            bt_signature,
            bt_payload.gsub(" ", "\n")
          )
          to_subscription(result.subscription)
        end
      end
    end
  end
end
