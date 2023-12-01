module RecurringBilling
  module Interfaces
    class RecurringBillingService
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
    end
  end
end
