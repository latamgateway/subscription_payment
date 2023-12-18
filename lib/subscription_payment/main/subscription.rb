# frozen_string_literal: true

module SubscriptionPayment
  module Main
    class Subscription
      def initialize(gateway)
        @service = gateway.service
      end

      def find(id:, destination:)
        @service.subscription.find(id: id, destination: destination)
      end

      def create(id:, payment_method_nonce:, plan_id:)
        @service.subscription.create(id: id, payment_method_nonce: payment_method_nonce, plan_id: plan_id)
      end

      def update(id:, payment_method_nonce:)
        @service.subscription.update(id: id, payment_method_nonce: payment_method_nonce)
      end

      def cancel(id:)
        @service.subscription.cancel(id: id)
      end

      def retry_charge(id:)
        @service.subscription.retry_charge(id: id)
      end
    end
  end
end
