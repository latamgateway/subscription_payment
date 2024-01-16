# frozen_string_literal: true

module SubscriptionPaymentApi
  module Providers
    module Braintree
      class Transaction < SubscriptionPaymentApi::Providers::Braintree::Base
        extend T::Sig

        sig do
          params(id: String)
            .returns(SubscriptionPaymentApi::Entity::Transaction)
        end
        def refund(id:)
          response = gateway.transaction.refund(id)

          raise SubscriptionPaymentApi::Exceptions::GeneralError.new(response.message) \
            unless response.success?

          to_transaction(response.transaction)
        rescue => e
          raise SubscriptionPaymentApi::Exceptions::GeneralError.new(e.message)
        end

        sig do
          params(id: String)
            .returns(SubscriptionPaymentApi::Entity::Transaction)
        end
        def void(id:)
          response = gateway.transaction.void(id)

          raise SubscriptionPaymentApi::Exceptions::GeneralError.new(response.message) \
            unless response.success?

          to_transaction(response.transaction)
        rescue => e
          raise SubscriptionPaymentApi::Exceptions::GeneralError.new(e.message)
        end
      end
    end
  end
end
