# frozen_string_literal: true

module SubscriptionPayment
  module Providers
    module Braintree
      class ClientToken < SubscriptionPayment::Providers::Braintree::Base
        extend T::Sig

        sig do
          returns(SubscriptionPayment::Entity::ClientToken)
        end
        def create
          token = gateway.client_token.generate
          to_client_token(token)
        end
      end
    end
  end
end
