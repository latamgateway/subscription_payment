# frozen_string_literal: true

module SubscriptionPayment
  module Providers
    module Braintree
      class PaymentMethod < SubscriptionPayment::Providers::Braintree::Base
        extend T::Sig

        sig do
          params(
            token: String
          ).returns(String)
        end
        def status_3ds(token:)
          result = gateway.payment_method_nonce.find(token)
          result.payment_method_nonce.three_d_secure_info.status
        end
      end
    end
  end
end
