module SubscriptionPayment
  module Entity
    class Subscription
      extend T::Sig

      sig { returns(String) }
      attr_accessor :id, :status, :plan_id, :created_at

      sig { returns(Integer) }
      attr_accessor :billing_day_of_month, :current_billing_cycle, :days_past_due, :failure_count

      sig { returns(Float) }
      attr_accessor :price

      sig do
        params(
          id: String,
          status: String,
          plan_id: String,
          created_at: String,
          price: Float,
          billing_day_of_month: T.nilable(Integer),
          current_billing_cycle: T.nilable(Integer),
          days_past_due: T.nilable(Integer),
          failure_count: T.nilable(Integer)
        ).void
      end
      def initialize(
        id:,
        status:,
        plan_id:,
        created_at:,
        price:,
        billing_day_of_month:,
        current_billing_cycle:,
        days_past_due:,
        failure_count:
      )
        @id = id
        @status = status
        @plan_id = plan_id
        @created_at = created_at
        @price = price
        @billing_day_of_month = billing_day_of_month
        @current_billing_cycle = current_billing_cycle
        @days_past_due = days_past_due
        @failure_count = failure_count
      end
    end
  end
end
