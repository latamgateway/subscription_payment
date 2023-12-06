# frozen_string_literal: true

module SubscriptionPayment
    module Providers
      module Braintree
        class Subscription
          extend T::Sig
  
          sig do
            params(
              gateway: ::Braintree::Gateway,
              payment_method_nonce_token: String,
              plan_id: String,
            ).returns(::Braintree::SuccessfulResult)
          end
          def create(gateway:, payment_method_nonce_token:, plan_id:)
            result = gateway.subscription.create(payment_method_nonce: payment_method_nonce_token, plan_id: plan_id)
          end
        end
      end
    end
end
  