module SubscriptionPayment
  module Entity
    class Transaction
      extend T::Sig

      sig { returns(String) }
      attr_accessor :id, :status, :created_at, :updated_at, :latam_id, :order_id, :type

      sig { returns(Float) }
      attr_accessor :amount, :discount_amount, :tax_amount

      sig do
        params(
          id: String,
          status: String,
          created_at: String,
          updated_at: String,
          amount: Float,
          discount_amount: T.nilable(Float),
          order_id: T.nilable(String),
          tax_amount: T.nilable(Float),
          type: T.nilable(String),
        ).void
      end
      def initialize(
        id:,
        status:,
        created_at:,
        updated_at:,
        amount:,
        discount_amount:,
        order_id:,
        tax_amount:,
        type:
      )
        @id = id
        @status = status
        @created_at = created_at
        @updated_at = updated_at
        @amount = amount
        @discount_amount = discount_amount
        @order_id = order_id
        @tax_amount = tax_amount
        @type = type
      end
    end
  end
end
