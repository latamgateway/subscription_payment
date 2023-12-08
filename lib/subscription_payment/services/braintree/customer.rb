# frozen_string_literal: true

module SubscriptionPayment
  module Services
    module Braintree
      class Customer
        def initialize
          @service = SubscriptionPayment::Providers::Braintree::Customer.new
        end

        def find(id:)
          @service.find(id: id)
        end

        def create(customer:)
          @service.create(customer: customer)
        end

        def update(customer:)
          @service.update(customer: customer)
        end
      end
    end
  end
end
