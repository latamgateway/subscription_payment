module RecurringBilling
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
          id: String,
          frequency: Integer,
          currency: String,
          price: Float
        ).void
      end
      def initialize(name:, frequency:, currency:, price:, id:)
        @name = name
        @frequency = frequency
        @currency = currency
        @price = price
        @id = id
      end
    end
  end
end