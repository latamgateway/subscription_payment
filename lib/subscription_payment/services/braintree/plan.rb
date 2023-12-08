# frozen_string_literal: true

module SubscriptionPayment
  module Services
    module Braintree
      class Plan
        def initialize
          @service = SubscriptionPayment::Providers::Braintree::Plan.new
        end

        def find(id:)

        end

        def create(plan:)
          @service.create(plan: plan)
        end

        def update(plan:)

        end
      end
    end
  end
end
