# frozen_string_literal: true

require "config/boot"

# The main module
module SubscriptionPayment
  class Gateway
    attr_reader :service, :logger

    def initialize
      factory = SubscriptionPayment::Factories::Factory.new
      @service = factory.service
      @logger = Logger.new(STDOUT)
      @logger.level = Logger::DEBUG
    end

    def customer
      SubscriptionPayment::Main::Customer.new(self)
    end

    def credit_card
      SubscriptionPayment::Main::CreditCard.new(self)
    end

    def address
      SubscriptionPayment::Main::Address.new(self)
    end

    def plan
      SubscriptionPayment::Main::Plan.new(self)
    end

    def subscription
      SubscriptionPayment::Main::Subscription.new(self)
    end

    def client_token
      SubscriptionPayment::Main::ClientToken.new(self)
    end

    def webhook
      SubscriptionPayment::Main::Webhook.new(self)
    end
  end
end
