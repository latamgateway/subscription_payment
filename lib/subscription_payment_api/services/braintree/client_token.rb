# frozen_string_literal: true

module SubscriptionPaymentApi
  module Services
    module Braintree
      class ClientToken
        def initialize
          @service = SubscriptionPaymentApi::Providers::Braintree::ClientToken.new
        end

        def create
          @service.create
        end
      end
    end
  end
end
