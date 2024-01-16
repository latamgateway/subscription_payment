# frozen_string_literal: true

module SubscriptionPaymentApi
  module Providers
    module Braintree
      class ClientToken < SubscriptionPaymentApi::Providers::Braintree::Base
        extend T::Sig

        sig do
          returns(SubscriptionPaymentApi::Entity::ClientToken)
        end
        def create
          token = gateway.client_token.generate
          to_client_token(token)
        end
      end
    end
  end
end
