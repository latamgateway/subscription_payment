# frozen_string_literal: true

module SubscriptionPayment
  module Services
    module Braintree
      class Subscription

        def initialize
          @service = SubscriptionPayment::Providers::Braintree::Subscription.new
        end

        def find(id:)
          @service.find(id: id)
        end

        def create(id:, payment_method_nonce:, plan_id:)
          @service.create(id: id, payment_method_nonce: payment_method_nonce, plan_id: plan_id)
        end

        def update(id:, payment_method_nonce:)
          @service.update(id: id, payment_method_nonce: payment_method_nonce)
        end

        def cancel(id:)
          @service.cancel(id: id)
        end

        def retry_charge(id:)
          @service.retry_charge(id: id)
        end
      end
    end
  end
end
