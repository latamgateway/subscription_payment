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
          amount: Float,
          latam_id: T.nilable(String)
        ).void
      end
      def initialize(
        id:,
        status:,
        created_at:,
        updated_at:,
        amount:,
        latam_id: nil
      )
        @id = id
        @status = status
        @created_at = created_at
        @updated_at = updated_at
        @amount = amount
        @latam_id = latam_id
      end
    end
  end
end
