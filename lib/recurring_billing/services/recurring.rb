module RecurringBilling
  module Services
    class Recurring
      extend T::Sig

      def initialize
        @environment = ENV['BRAINTREE_ENVIRONMENT']
        @merchant_id = ENV['BRAINTREE_MERCHANT_ID']
        @public_key = ENV['BRAINTREE_PUBLIC_KEY']
        @private_key = ENV['BRAINTREE_PRIVATE_KEY']

        @gateway = RecurringBilling::Providers::Braintree.new(
          environment: @environment,
          merchant_id: @merchant_id,
          public_key: @public_key,
          private_key: @private_key
        ).gateway
      end

      sig do
        params(plan: RecurringBilling::Entity::Plan)
          .returns(::Braintree::SuccessfulResult)
      end
      def create_plan(plan)
        @gateway.plan.create(
          :name => plan.name,
          :billing_frequency => plan.frequency,
          :currency_iso_code => plan.currency,
          :price => plan.price
        )
      end
    end
  end
end
