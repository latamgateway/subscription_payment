# frozen_string_literal: true

module SubscriptionPaymentApi
  module Services
    module Braintree
      class Plan
        def initialize
          @service = SubscriptionPaymentApi::Providers::Braintree::Plan.new
        end

        def find(id:)
          @service.find(id: id)
        end

        def create(plan:)
          @service.create(plan: plan)
        end

        def update(plan:)
          @service.update(plan: plan)
        end
      end
    end
  end
end
