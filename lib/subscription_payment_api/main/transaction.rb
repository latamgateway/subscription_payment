# frozen_string_literal: true

module SubscriptionPaymentApi
  module Main
    class Transaction
      def initialize(gateway)
        @service = gateway.service
      end

      def refund(id:)
        @service.transaction.refund(id: id)
      end

      def void(id:)
        @service.transaction.void(id: id)
      end
    end
  end
end