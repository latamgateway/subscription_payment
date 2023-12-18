module SubscriptionPayment
  module Entity
    class Webhook
      extend T::Sig

      sig { returns(String) }
      attr_accessor :kind

      sig { returns(SubscriptionPayment::Entity::Subscription) }
      attr_accessor :subscription

      sig do
        params(
          kind: String,
          subscription: T.nilable(SubscriptionPayment::Entity::Subscription)
          ).void
      end
      def initialize(
        kind:,
        subscription: nil
      )
        @kind = kind
        @subscription = subscription
      end
    end
  end
end
