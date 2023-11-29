module RecurringBilling
  module Entity
    class Plan
      extend T::Sig

      sig { returns(String) }
      attr_accessor :name, :currency

      sig { returns(Integer) }
      attr_accessor :frequency

      sig { returns(Float) }
      attr_accessor :price

      sig do
        params(
          name: String,
          frequency: Integer,
          currency: String,
          price: Float
        ).void
      end
      def initialize(name:, frequency:, currency:, price:)
        @name = name
        @frequency = frequency
        @currency = currency
        @price = price
      end
    end
  end
end