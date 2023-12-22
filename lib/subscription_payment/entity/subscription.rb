module SubscriptionPayment
  module Entity
    class Subscription
      extend T::Sig

      sig { returns(String) }
      attr_accessor :id, :status, :plan_id, :created_at, :billing_period_end_date, :billing_period_start_date, :description, :first_billing_date, :next_billing_date, :paid_through_date, :updated_at, :trial_duration_unit

      sig { returns(Integer) }
      attr_accessor :billing_day_of_month, :current_billing_cycle, :days_past_due, :failure_count, :number_of_billing_cycles, :trial_duration

      sig { returns(Float) }
      attr_accessor :price, :balance, :next_billing_period_amount 

      sig { returns(T::Boolean) }
      attr_accessor :never_expires, :trial_period

      sig { returns(T.nilable(T::Array[SubscriptionPayment::Entity::Transaction])) }
      attr_accessor :transactions

      sig do
        params(
          id: String,
          balance: Float,
          created_at: String,
          never_expires: T::Boolean,
          plan_id: String,
          price: Float,
          status: String,
          billing_day_of_month: T.nilable(Integer),
          billing_period_end_date: T.nilable(String),
          billing_period_start_date: T.nilable(String),
          current_billing_cycle: T.nilable(Integer),
          days_past_due: T.nilable(Integer),
          description: T.nilable(String),
          failure_count: T.nilable(Integer),
          first_billing_date: T.nilable(String),
          next_billing_date: T.nilable(String),
          next_billing_period_amount: T.nilable(Float),
          number_of_billing_cycles: T.nilable(Integer),
          paid_through_date: T.nilable(String),
          updated_at: T.nilable(String),
          trial_duration: T.nilable(Integer),
          trial_duration_unit: T.nilable(String),
          trial_period: T.nilable(T::Boolean),
          transactions: T.nilable(T::Array[SubscriptionPayment::Entity::Transaction])
        ).void
      end
      def initialize(
        id:,
        balance:,
        created_at:,
        never_expires:,
        plan_id:,
        price:,
        status:,
        billing_day_of_month: nil,
        billing_period_end_date: nil,
        billing_period_start_date: nil,
        current_billing_cycle: nil,
        days_past_due: nil,
        description: nil,
        failure_count: nil,
        first_billing_date: nil,
        next_billing_date: nil,
        next_billing_period_amount: nil,
        number_of_billing_cycles: nil,
        paid_through_date: nil,
        updated_at: nil,
        trial_duration: nil,
        trial_duration_unit: nil,
        trial_period: nil,
        transactions: nil
      )
        @id= id
        @balance= balance
        @created_at= created_at
        @never_expires= never_expires
        @plan_id= plan_id
        @price= price
        @status= status
        @billing_day_of_month= billing_day_of_month
        @billing_period_end_date= billing_period_end_date
        @billing_period_start_date= billing_period_start_date
        @current_billing_cycle= current_billing_cycle
        @days_past_due= days_past_due
        @description= description
        @failure_count= failure_count
        @first_billing_date= first_billing_date
        @next_billing_date= next_billing_date
        @next_billing_period_amount= next_billing_period_amount
        @number_of_billing_cycles= number_of_billing_cycles
        @paid_through_date= paid_through_date
        @updated_at= updated_at
        @trial_duration= trial_duration
        @trial_duration_unit= trial_duration_unit
        @trial_period= trial_period
        @transactions= transactions
      end

      def to_api
        hash = to_hash()
        hash.delete(:next_billing_period_amount)
        hash.delete(:trial_duration)
        hash.delete(:trial_duration_unit)
        hash.delete(:trial_period)

        hash[:transactions].each do |transaction|
          transaction.delete(:discount_amount)
          transaction.delete(:tax_amount)
          transaction.delete(:type)
          transaction.delete(:is_three_d_secure)
          transaction.delete(:three_d_secure_status)
          case transaction[:status]
          when "authorized", "authorizing", "submitted_for_settlement", "settling"
            transaction[:status] = "Awaiting Payment"
          when "settled"
            transaction[:status] = "Paid"
          when "failed", "authorization_expired", "gateway_rejected", "processor_declined", "voided"
            transaction[:status] = "Failed"
          when "refunded"
            transaction[:status] = "Reversed"
          else
            transaction.delete(:status)
          end
        end
        return hash
      end

      private
      def to_hash
        transactions = []
        @transactions.each do |transaction| 
          transactions << transaction.to_hash
        end

        {
          id: @id,
          balance: @balance,
          created_at: @created_at,
          never_expires: @never_expires,
          plan_id: @plan_id,
          price: @price,
          status: @status,
          billing_day_of_month: @billing_day_of_month,
          billing_period_end_date: @billing_period_end_date,
          billing_period_start_date: @billing_period_start_date,
          current_billing_cycle: @current_billing_cycle,
          days_past_due: @days_past_due,
          description: @description,
          failure_count: @failure_count,
          first_billing_date: @first_billing_date,
          next_billing_date: @next_billing_date,
          next_billing_period_amount: @next_billing_period_amount,
          number_of_billing_cycles: @number_of_billing_cycles,
          paid_through_date: @paid_through_date,
          updated_at: @updated_at,
          trial_duration: @trial_duration,
          trial_duration_unit: @trial_duration_unit,
          trial_period: @trial_period,
          transactions: transactions
        }
      end
    end
  end
end
