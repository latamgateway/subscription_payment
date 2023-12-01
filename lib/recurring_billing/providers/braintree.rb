module RecurringBilling
  module Providers
    class Braintree
      extend T::Sig

      sig { returns(String) }
      attr_accessor :environment, :merchant_id, :public_key, :private_key

      sig do
        params(
          environment: String,
          merchant_id: String,
          public_key: String,
          private_key: String
        ).void
      end
      def initialize(environment:, merchant_id:, public_key:, private_key:)
        @environment = environment
        @merchant_id = merchant_id
        @public_key = public_key
        @private_key = private_key
      end

      sig { returns(::Braintree::Gateway) }
      def gateway
        ::Braintree::Gateway.new(
          :environment => @environment,
          :merchant_id => @merchant_id,
          :public_key => @public_key,
          :private_key => @private_key,
        )
      end

      def create_plan(plan)
        gateway.plan.create(
          :name => plan.name,
          :billing_frequency => plan.frequency,
          :currency_iso_code => plan.currency,
          :price => plan.price
        )
      end

      def create_customer(customer)
        gateway.customer.create(
          :first_name => customer.first_name,
          :last_name => customer.last_name,
          :company => customer.company,
          :email => customer.email,
          :phone => customer.phone,
          :fax => customer.fax,
          :website => customer.website,
          :credit_card => {
            :cardholder_name => customer.credit_card.cardholder_name,
            :number => customer.credit_card.number,
            :expiration_date => customer.credit_card.expiration_date,
            :options => {
              :make_default => true,
              :verify_card => true
            },
            :billing_address => {
              :first_name => customer.billing_address.first_name,
              :last_name => customer.billing_address.last_name,
              :company => customer.billing_address.company,
              :street_address => customer.billing_address.street_address,
              :locality => customer.billing_address.locality,
              :region => customer.billing_address.region,
              :postal_code => customer.billing_address.postal_code
            }
          }
        )
      end

      def create_payment_method_nonce(credit_card_token)
        result = gateway.payment_method_nonce.create(credit_card_token)
        result.payment_method_nonce.nonce
      end

      def create_subscription(credit_card_token, plan_id)
        gateway.subscription.create(
          :payment_method_token => card_token,
          :plan_id => plan_id
        )
      end

    end
  end
end

