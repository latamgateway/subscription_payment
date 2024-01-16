# frozen_string_literal: true

module SubscriptionPaymentApi
  module Services
    module Braintree
      class Address
        def initialize
          @service = SubscriptionPaymentApi::Providers::Braintree::Address.new
        end

        def find(customer_id:, id:)
          @service.find(customer_id: customer_id, id: id)
        end

        def create(address:)
          @service.create(address: address)
        end

        def update(address:)
          @service.update(address: address)
        end
      end
    end
  end
end
