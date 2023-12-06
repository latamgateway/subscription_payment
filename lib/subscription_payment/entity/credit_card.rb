# frozen_string_literal: true

module SubscriptionPayment
  module Entity
    class CreditCard
      extend T::Sig

      sig { returns(String) }
      attr_accessor :holder_name, :number, :expiration_date, :cvv

      sig do
        params(
          holder_name: String,
          number: String,
          expiration_date: String,
          cvv: String
        ).void
      end
      def initialize(holder_name:, number:, expiration_date:, cvv:)
        @holder_name = holder_name
        @number = number
        @expiration_date = expiration_date
        @cvv = cvv
      end
    end
  end
end
