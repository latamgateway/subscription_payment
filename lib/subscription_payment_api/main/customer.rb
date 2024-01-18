# frozen_string_literal: true

module SubscriptionPaymentApi
  module Main
    class Customer
      def initialize(gateway)
        @service = gateway.service
      end

      def find(id:)
        @service.customer.find(id: id)
      end

      def create(customer:)
        @service.customer.create(customer: customer)
      end

      def update(customer:)
        @service.customer.update(customer: customer)
      end
    end
  end
end
