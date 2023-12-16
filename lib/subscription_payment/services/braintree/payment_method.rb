# frozen_string_literal: true

module SubscriptionPayment
  module Services
    module Braintree
      class PaymentMethod
        def initialize
          @service = SubscriptionPayment::Providers::Braintree::PaymentMethod.new
        end

        def status_3ds(token:)
          @service.status_3ds(token: token)
        end
      end
    end
  end
end
