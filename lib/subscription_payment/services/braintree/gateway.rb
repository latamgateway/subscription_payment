# frozen_string_literal: true

module SubscriptionPayment
  module Services
    module Braintree
      class Gateway
        def customer
          SubscriptionPayment::Services::Braintree::Customer.new
        end

        def credit_card
          SubscriptionPayment::Services::Braintree::CreditCard.new
        end

        def address
          SubscriptionPayment::Services::Braintree::Address.new
        end

        def plan
          SubscriptionPayment::Services::Braintree::Plan.new
        end

        def subscription
          SubscriptionPayment::Services::Braintree::Subscription.new
        end

        def transaction
          SubscriptionPayment::Services::Braintree::Transaction.new
        end

        def client_token
          SubscriptionPayment::Services::Braintree::ClientToken.new
        end
        
        def webhook
          SubscriptionPayment::Services::Braintree::Webhook.new
        end
      end
    end
  end
end
