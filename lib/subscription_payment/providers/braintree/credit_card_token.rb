# frozen_string_literal: true

module SubscriptionPayment
    module Providers
      module Braintree
        class CreditCardToken
          extend T::Sig
  
          sig do
            params(
              gateway: ::Braintree::Gateway,
              credit_card_token: String
            ).returns(String)
          end
          def create_payment_method_nonce(gateway:, credit_card_token:)
            result = gateway.payment_method_nonce.create(credit_card_token)
            result.payment_method_nonce.nonce
          end
        end
      end
    end
  end
    
    