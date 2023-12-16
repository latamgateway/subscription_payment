module SubscriptionPayment
  module Entity
    class Transaction
      extend T::Sig

      sig { returns(String) }
      attr_accessor :id, :status, :created_at, :updated_at, :latam_id, :order_id, :type,
                    :card_holder, :card_last_digits, :card_bin, :card_expiration, :card_brand,
                    :three_d_secure_status

      sig { returns(Float) }
      attr_accessor :amount, :discount_amount, :tax_amount

      sig { returns(T::Boolean) }
      attr_accessor :is_three_d_secure

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
          card_holder: T.nilable(String),
          card_last_digits: T.nilable(String),
          card_bin: T.nilable(String),
          card_expiration: T.nilable(String),
          card_brand: T.nilable(String),
          is_three_d_secure: T::Boolean,
          three_d_secure_status: T.nilable(String),
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
        type:,
        card_holder:nil,
        card_last_digits:nil,
        card_bin:nil,
        card_expiration:nil,
        card_brand:nil,
        is_three_d_secure: false,
        three_d_secure_status: nil
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
        @card_holder = card_holder
        @card_last_digits = card_last_digits
        @card_bin = card_bin
        @card_expiration = card_expiration
        @card_brand = card_brand
        @is_three_d_secure = is_three_d_secure
        @three_d_secure_status = three_d_secure_status
      end
    end
  end
end
