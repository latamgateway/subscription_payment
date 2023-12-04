module RecurringBilling
  module Interfaces
    class BaseInterface
      extend T::Sig

      sig do
        params(plan: RecurringBilling::Entity::Plan)
          .returns(::RecurringBilling::Entity::Plan)
      end
      def create_plan(plan)
        raise NoMethodError, "Method #{__method__} not implemented in #{self.class.name}"
      end

      sig do
        params(customer: RecurringBilling::Entity::Customer)
          .returns(::RecurringBilling::Entity::Customer)
      end
      def create_customer(customer)
        raise NoMethodError, "Method #{__method__} not implemented in #{self.class.name}"
      end

      sig do
        params(credit_card_token: String)
          .returns(String)
      end
      def create_payment_method_nonce(credit_card_token)
        raise NoMethodError, "Method #{__method__} not implemented in #{self.class.name}"
      end

      sig do
        params(credit_card_token: String, plan_id: String)
          .returns(String)
      end
      def create_subscription(credit_card_token, plan_id)
        raise NoMethodError, "Method #{__method__} not implemented in #{self.class.name}"
      end

    end
  end
end
