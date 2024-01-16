module SubscriptionPaymentApi
  module Entity
    class Webhook
      extend T::Sig

      sig { returns(String) }
      attr_accessor :kind

      sig { returns(SubscriptionPaymentApi::Entity::Subscription) }
      attr_accessor :subscription

      sig do
        params(
          kind: String,
          subscription: T.nilable(SubscriptionPaymentApi::Entity::Subscription)
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
