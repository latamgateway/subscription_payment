# frozen_string_literal: true

module SubscriptionPayment
  module Main
    class Transaction
      def initialize(gateway)
        @service = gateway.service
      end

      def refund(id:)
        @service.transaction.refund(id: id)
      end
    end
  end
end