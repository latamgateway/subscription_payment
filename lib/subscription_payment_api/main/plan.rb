# frozen_string_literal: true

module SubscriptionPaymentApi
  module Main
    class Plan
      def initialize(gateway)
        @service = gateway.service
      end

      def find(id:)
        @service.plan.find(id: id)
      end

      def create(plan:)
        @service.plan.create(plan: plan)
      end

      def update(plan:)
        @service.plan.update(plan: plan)
      end
    end
  end
end
