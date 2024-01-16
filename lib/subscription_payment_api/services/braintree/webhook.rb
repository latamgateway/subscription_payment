# frozen_string_literal: true

module SubscriptionPaymentApi
  module Services
    module Braintree
      class Webhook

        def initialize
          @service = SubscriptionPaymentApi::Providers::Braintree::Webhook.new
        end

        def parse(bt_signature:, bt_payload:)
          @service.parse(bt_signature: bt_signature, bt_payload: bt_payload)
        end
      end
    end
  end
end
