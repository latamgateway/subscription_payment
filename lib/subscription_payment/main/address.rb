# frozen_string_literal: true

module SubscriptionPayment
  module Main
    class Address
      def initialize(gateway)
        @service = gateway.service
      end

      def find(customer_id:, id:)
        @service.address.find(id: id, customer_id: customer_id)
      end

      def create(address:)
        @service.address.create(address: address)
      end

      def update(address:)
        @service.address.update(address: address)
      end
    end
  end
end