# frozen_string_literal: true

module SubscriptionPayment
  module Entity
    class CreditCard
      extend T::Sig

      sig { returns(String) }
      attr_accessor :holder_name, :number, :expiration_date, :cvv, :token, :customer_id, :address_id

      sig do
        params(
          customer_id: String,
          holder_name: String,
          number: String,
          expiration_date: String,
          cvv: String,
          token: T.nilable(String),
          address_id: T.nilable(String)
        ).void
      end
      def initialize(customer_id:, holder_name:, number:, expiration_date:, cvv:, token: nil, address_id: nil)
        @customer_id = customer_id
        @holder_name = holder_name
        @number = number
        @expiration_date = expiration_date
        @cvv = cvv
        @token = token
        @address_id = address_id
      end
    end
  end
end
