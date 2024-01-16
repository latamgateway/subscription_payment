# frozen_string_literal: true

require "config/boot"

# The main module
module SubscriptionPaymentApi
  class Gateway
    attr_reader :service, :logger

    def initialize
      factory = SubscriptionPaymentApi::Factories::Factory.new
      @service = factory.service
      @logger = Logger.new(STDOUT)
      @logger.level = Logger::DEBUG
    end

    def customer
      SubscriptionPaymentApi::Main::Customer.new(self)
    end

    def credit_card
      SubscriptionPaymentApi::Main::CreditCard.new(self)
    end

    def address
      SubscriptionPaymentApi::Main::Address.new(self)
    end

    def plan
      SubscriptionPaymentApi::Main::Plan.new(self)
    end

    def subscription
      SubscriptionPaymentApi::Main::Subscription.new(self)
    end

    def transaction
      SubscriptionPaymentApi::Main::Transaction.new(self)
    end

    def client_token
      SubscriptionPaymentApi::Main::ClientToken.new(self)
    end

    def webhook
      SubscriptionPaymentApi::Main::Webhook.new(self)
    end
  end
end
