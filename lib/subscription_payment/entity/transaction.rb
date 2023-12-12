module SubscriptionPayment
  module Entity
    class Transaction
      extend T::Sig

      sig { returns(String) }
      attr_accessor :id, :status, :created_at, :updated_at, :latam_id

      sig { returns(Float) }
      attr_accessor :amount

      sig do
        params(
          id: String,
          status: String,
          created_at: String,
          updated_at: String,
          amount: Float
        ).void
      end
      def initialize(
        id:,
        status:,
        created_at:,
        updated_at:,
        amount:
      )
        @id = id
        @status = status
        @created_at = created_at
        @updated_at = updated_at
        @amount = amount
      end
    end
  end
end
