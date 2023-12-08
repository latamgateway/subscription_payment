# frozen_string_literal: true

module SubscriptionPayment
  module Main
    class Subscription
      def initialize(gateway)
        @service = gateway.service
      end

      def find(id:)
        @service.subscription.find(id: id)
      end

      def create(subscription:)
        @service.subscription.create(subscription: subscription)
      end

      def update(subscription:)
        @service.subscription.update(subscription: subscription)
      end
    end
  end
end
