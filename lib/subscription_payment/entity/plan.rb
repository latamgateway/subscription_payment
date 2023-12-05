# frozen_string_literal: true

module SubscriptionPayment
  module Entity
    class Plan
      extend T::Sig

      sig { returns(String) }
      attr_accessor :name, :currency, :id

      sig { returns(Integer) }
      attr_accessor :frequency

      sig { returns(Float) }
      attr_accessor :price

      sig do
        params(
          name: String,
          frequency: Integer,
          currency: String,
          price: Float,
          id: T.nilable(String)
        ).void
      end

      def initialize(name:, frequency:, currency:, price:, id: nil)
        @name = name
        @frequency = frequency
        @currency = currency
        @price = price
        @id = id
      end
    end
  end
end
