# frozen_string_literal: true

module SubscriptionPaymentApi
  module Main
    class Webhook
      def initialize(gateway)
        @service = gateway.service
      end

      def parse(bt_signature:, bt_payload:)
        @service.webhook.parse(bt_signature: bt_signature, bt_payload: bt_payload)
      end
    end
  end
end
