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
          merchant_id = ENV["BRAINTREE_ACCOUNT_ID"]
          token = merchant_id.nil? \
                    ? gateway.client_token.generate
                    : gateway.client_token.generate(merchant_account_id: merchant_id)
          to_client_token(token)
        end
      end
    end
  end
end
