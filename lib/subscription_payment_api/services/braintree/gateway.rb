# frozen_string_literal: true

module SubscriptionPaymentApi
  module Services
    module Braintree
      class Gateway
        def customer
          SubscriptionPaymentApi::Services::Braintree::Customer.new
        end

        def credit_card
          SubscriptionPaymentApi::Services::Braintree::CreditCard.new
        end

        def address
          SubscriptionPaymentApi::Services::Braintree::Address.new
        end

        def plan
          SubscriptionPaymentApi::Services::Braintree::Plan.new
        end

        def subscription
          SubscriptionPaymentApi::Services::Braintree::Subscription.new
        end

        def transaction
          SubscriptionPaymentApi::Services::Braintree::Transaction.new
        end

        def client_token
          SubscriptionPaymentApi::Services::Braintree::ClientToken.new
        end
        
        def webhook
          SubscriptionPaymentApi::Services::Braintree::Webhook.new
        end
      end
    end
  end
end
