module SubscriptionPayment
  module Entity
    class Subscription
      extend T::Sig

      sig { returns(String) }
      attr_accessor :plan_id, :credit_card_nonce, :id

      sig do
        params(
          plan_id: String,
          credit_card_nonce: String
          ).void
      end
      def initialize(
        plan_id:,
        credit_card_nonce:,
        id: nil
      )
        @plan_id = plan_id
        @credit_card_nonce = credit_card_nonce
        @id = id
      end
    end
  end
end
