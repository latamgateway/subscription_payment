# frozen_string_literal: true

module SubscriptionPayment
  module Services
    module Braintree
      class Transaction
        def initialize
          @service = SubscriptionPayment::Providers::Braintree::Transaction.new
        end

        def refund(id:)
          @service.refund(id: id)
        end
      end
    end
  end
end
