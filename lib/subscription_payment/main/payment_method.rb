# frozen_string_literal: true

module SubscriptionPayment
  module Main
    class PaymentMethod
      def initialize(gateway)
        @service = gateway.service
      end

      def status_3ds(token:)
        @service.payment_method.status_3ds(token: token)
      end
    end
  end
end
