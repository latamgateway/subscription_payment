# frozen_string_literal: true

module SubscriptionPayment
  module Entity
    class Plan
      extend T::Sig

      sig { returns(String) }
      attr_accessor :name, :currency, :id, :description

      sig { returns(Integer) }
      attr_accessor :frequency, :billing_day_of_month, :number_of_billing_cycles

      sig { returns(Float) }
      attr_accessor :price

      sig do
        params(
          name: String,
          frequency: Integer,
          currency: String,
          price: Float,
          id: T.nilable(String),
          billing_day_of_month: T.nilable(Integer),
          number_of_billing_cycles: T.nilable(Integer),
          description: T.nilable(String),
        ).void
      end

      def initialize(
        name:,
        frequency:,
        currency:,
        price:,
        id: nil,
        billing_day_of_month: nil,
        number_of_billing_cycles: nil,
        description: nil
      )
        @name = name
        @frequency = frequency
        @currency = currency
        @price = price
        @id = id
        @billing_day_of_month = billing_day_of_month
        @number_of_billing_cycles = number_of_billing_cycles
        @description = description
      end
    end
  end
end
