# frozen_string_literal: true

module SubscriptionPaymentApi
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

          SubscriptionPaymentApi::Entity::Customer.new(**payload)
        end

        def to_address(from)
          SubscriptionPaymentApi::Entity::Address.new(
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

          SubscriptionPaymentApi::Entity::CreditCard.new(**hash_fields)
        end

        def to_plan(from)
          SubscriptionPaymentApi::Entity::Plan.new(
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

        def to_subscription(from, destination)
          transactions = []
          from.transactions.each do |element|
            transaction_hash = {
              id: element.id,
              status: element.status,
              created_at: element.created_at.strftime("%Y-%m-%d"),
              updated_at: element.updated_at.strftime("%Y-%m-%d"),
              amount: element.amount.to_f,
              discount_amount: element.discount_amount.to_f,
              order_id: element.order_id,
              tax_amount: element.tax_amount,
              type: element.type,
              card_last_digits: element.credit_card_details.last_4,
              card_brand: element.credit_card_details.card_type
            }

            if destination == 'internal'
              transaction_hash.merge!(
                card_holder: element.credit_card_details.cardholder_name,
                card_bin: element.credit_card_details.bin,
                card_expiration: element.credit_card_details.expiration_date,
              )
            end

            transaction_hash[:is_three_d_secure] = true unless element.three_d_secure_info.nil?
            transaction_hash[:three_d_secure_status] = element.three_d_secure_info.status \
              unless element.three_d_secure_info.nil?

            transaction = SubscriptionPaymentApi::Entity::Transaction.new(**transaction_hash)
            transactions << transaction
          end


          SubscriptionPaymentApi::Entity::Subscription.new(
            id: from.id,
            balance: from.balance.to_f,
            created_at: from.created_at.strftime("%Y-%m-%d"),
            never_expires: from.never_expires?,
            plan_id: from.plan_id,
            price: from.price.to_f,
            status: from.status,
            billing_day_of_month: from.billing_day_of_month,
            billing_period_end_date: from.billing_period_end_date.nil? ? from.billing_period_end_date : from.billing_period_end_date.strftime("%Y-%m-%d"),
            billing_period_start_date: from.billing_period_start_date.nil? ? from.billing_period_start_date : from.billing_period_start_date.strftime("%Y-%m-%d"),
            current_billing_cycle: from.current_billing_cycle,
            days_past_due: from.days_past_due,
            description: from.description,
            failure_count: from.failure_count,
            first_billing_date: from.first_billing_date.strftime("%Y-%m-%d"),
            next_billing_date: from.next_billing_date.strftime("%Y-%m-%d"),
            next_billing_period_amount: from.next_billing_period_amount.to_f,
            number_of_billing_cycles: from.number_of_billing_cycles,
            paid_through_date: from.paid_through_date.nil? ? from.paid_through_date : from.paid_through_date.strftime("%Y-%m-%d"),
            updated_at: from.updated_at.strftime("%Y-%m-%d"),
            trial_duration: from.trial_duration,
            trial_duration_unit: from.trial_duration_unit,
            trial_period: from.trial_period,
            transactions: transactions
          )
        end

        def to_transaction(element)
          transaction_hash = {
            id: element.id,
            status: element.status,
            created_at: element.created_at.strftime("%Y-%m-%d"),
            updated_at: element.updated_at.strftime("%Y-%m-%d"),
            amount: element.amount.to_f,
            discount_amount: element.discount_amount.to_f,
            order_id: element.order_id,
            tax_amount: element.tax_amount,
            type: element.type,
            card_last_digits: element.credit_card_details.last_4,
            card_brand: element.credit_card_details.card_type,
            card_holder: element.credit_card_details.cardholder_name,
            card_bin: element.credit_card_details.bin,
            card_expiration: element.credit_card_details.expiration_date,
          }

          transaction_hash[:is_three_d_secure] = true unless element.three_d_secure_info.nil?
          transaction_hash[:three_d_secure_status] = element.three_d_secure_info.status \
            unless element.three_d_secure_info.nil?

          SubscriptionPaymentApi::Entity::Transaction.new(**transaction_hash)
        end

        def to_client_token(token)
          SubscriptionPaymentApi::Entity::ClientToken.new(
            client_token: token
          )
        end
      end
    end
  end
end
