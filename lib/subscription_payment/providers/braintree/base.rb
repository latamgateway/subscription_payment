# frozen_string_literal: true

module SubscriptionPayment
  module Providers
    module Braintree
      class Base
        def initialize
          @environment = ENV["BRAINTREE_ENV"]
          @merchant_id = ENV["BRAINTREE_MERCHANT_ID"]
          @public_key = ENV["BRAINTREE_PUBLIC_KEY"]
          @private_key = ENV["BRAINTREE_PRIVATE_KEY"]
        end

        def gateway
          ::Braintree::Gateway.new(
            environment: @environment,
            merchant_id: @merchant_id,
            public_key: @public_key,
            private_key: @private_key
          )
        end

        def to_customer(from)

          addresses = []
          if from.addresses && from.addresses.size > 0
            from.addresses.map do |address|
              addresses << to_address(address)
            end
          end

          credit_cards = []
          if from.credit_cards && from.credit_cards.size > 0
            from.credit_cards.map do |credit_card|
              credit_cards << to_credit_card(credit_card)
            end
          end

          payload = {
            first_name: from.first_name,
            email: from.email,
            phone: from.phone,
            document: from.custom_fields[:document]
          }

          payload[:addresses] = addresses if addresses.size > 0
          payload[:credit_cards] = credit_cards if credit_cards.size > 0
          payload[:id] = from.id unless from.id.nil?

          SubscriptionPayment::Entity::Customer.new(**payload)
        end

        def to_address(from)
          SubscriptionPayment::Entity::Address.new(
            customer_id: from.customer_id,
            street_address: from.street_address,
            locality: from.locality,
            region: from.region,
            postal_code: from.postal_code,
            extended_address: from.extended_address,
            id: from.id
          )
        end

        def to_credit_card(from)
          hash_fields = {
            customer_id: from.customer_id,
            holder_name: from.cardholder_name,
            number: "#{from.bin}**#{from.last_4}",
            expiration_date: "#{from.expiration_month}/#{from.expiration_year}",
            cvv: "***",
            token: from.token
          }
          hash_fields[:address_id] = from.billing_address.id unless from.billing_address.nil?

          SubscriptionPayment::Entity::CreditCard.new(**hash_fields)
        end

        def to_plan(from)
          SubscriptionPayment::Entity::Plan.new(
            name: from.name,
            frequency: from.billing_frequency,
            currency: from.currency_iso_code,
            price: from.price.to_f,
            id: from.id,
            billing_day_of_month: from.billing_day_of_month,
            number_of_billing_cycles: from.number_of_billing_cycles,
            description: from.description,
            )
        end

        def to_subscription(from)
          SubscriptionPayment::Entity::Subscription.new(
            id: from.id,
            status: from.status,
            plan_id: from.plan_id,
            created_at: from.created_at.strftime("%Y-%m-%d"),
            price: from.price.to_f,
            billing_day_of_month: from.billing_day_of_month,
            current_billing_cycle: from.current_billing_cycle,
            days_past_due: from.days_past_due,
            failure_count: from.failure_count
          )
        end

        def to_client_token(token)
          SubscriptionPayment::Entity::ClientToken.new(
            client_token: token
          )
        end
      end
    end
  end
end
