# frozen_string_literal: true

module SubscriptionPaymentApi
  module Factories
    class Factory
      SERVICES = {
        braintree: SubscriptionPaymentApi::Services::Braintree::Gateway
      }.freeze

      def service
        provider = ENV["SUBSCRIPTION_PAYMENT_PROVIDER"]
        service = SERVICES[provider.to_sym]
        service.new
      end
    end
  end
end
