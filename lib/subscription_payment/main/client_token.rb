# frozen_string_literal: true

module SubscriptionPayment
  module Main
    class ClientToken
      def initialize(gateway)
        @service = gateway.service
      end

      def create
        @service.client_token.create
      end
    end
  end
end