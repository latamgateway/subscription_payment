# frozen_string_literal: true

module SubscriptionPayment
  module Factories
    class Factory
      SERVICES = {
        braintree: SubscriptionPayment::Services::BraintreeService
      }.freeze

      def service
        provider = ENV["PROVIDER"]
        service = SERVICES[provider.to_sym]
        service.new
      end
    end
  end
end
