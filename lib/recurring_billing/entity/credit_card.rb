module RecurringBilling
  module Entity
    class CreditCard
      extend T::Sig

      sig { returns(String) }
      attr_accessor :cardholder_name, :number, :expiration_date

      sig do
        params(
          cardholder_name: String,
          number: String,
          expiration_date: String
        ).void
      end
      def initialize(cardholder_name:, number:, expiration_date:)
        @cardholder_name = cardholder_name
        @number = number
        @expiration_date = expiration_date
      end
    end
  end
end