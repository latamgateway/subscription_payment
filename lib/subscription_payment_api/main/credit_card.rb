# frozen_string_literal: true

module SubscriptionPaymentApi
  module Main
    class CreditCard
      def initialize(gateway)
        @service = gateway.service
      end

      def find(token:)
        @service.credit_card.find(token: token)
      end

      def create(credit_card:)
        @service.credit_card.create(credit_card: credit_card)
      end

      def update(credit_card:)
        @service.credit_card.update(credit_card: credit_card)
      end

      def create_nonce(token:)
        @service.credit_card.create_nonce(token: token)
      end
    end
  end
end
