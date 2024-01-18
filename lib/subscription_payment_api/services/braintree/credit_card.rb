# frozen_string_literal: true

module SubscriptionPaymentApi
  module Services
    module Braintree
      class CreditCard
        def initialize
          @service = SubscriptionPaymentApi::Providers::Braintree::CreditCard.new
        end

        def find(token:)
          @service.find(token: token)
        end

        def create(credit_card:)
          @service.create(credit_card: credit_card)
        end

        def update(credit_card:)
          @service.update(credit_card: credit_card)
        end

        def create_nonce(token:)
          @service.create_nonce(token: token)
        end
      end
    end
  end
end
