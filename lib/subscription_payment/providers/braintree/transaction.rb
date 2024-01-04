# frozen_string_literal: true

module SubscriptionPayment
  module Providers
    module Braintree
      class Transaction < SubscriptionPayment::Providers::Braintree::Base
        extend T::Sig

        sig do
          params(id: String)
            .returns(SubscriptionPayment::Entity::Transaction)
        end
        def refund(id:)
          response = gateway.transaction.refund(id)

          raise SubscriptionPayment::Exceptions::GeneralError.new(response.message) \
            unless response.success?

          to_transaction(response.transaction)
        rescue => e
          raise SubscriptionPayment::Exceptions::GeneralError.new(e.message)
        end
      end
    end
  end
end
