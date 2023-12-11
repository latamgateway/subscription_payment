# frozen_string_literal: true

module SubscriptionPayment
  module Services
    module Braintree
      class ClientToken
        def initialize
          @service = SubscriptionPayment::Providers::Braintree::ClientToken.new
        end

        def create
          @service.create
        end
      end
    end
  end
end
