# frozen_string_literal: true

module SubscriptionPayment
  module Providers
    module Braintree
      class Customer < SubscriptionPayment::Providers::Braintree::Base
        extend T::Sig

        sig do
          params(
            id: String
          ).returns(SubscriptionPayment::Entity::Customer)
        end
        def find(id:)
          customer = gateway.customer.find(id)
          to_customer(customer)
        end

        sig do
          params(
            customer: SubscriptionPayment::Entity::Customer
          ).returns(SubscriptionPayment::Entity::Customer)
        end
        def create(customer:)
          response = gateway.customer.create(
            first_name: customer.first_name,
            email: customer.email,
            phone: customer.phone,
            custom_fields: { document: customer.document }
            # credit_card: {
            #   cardholder_name: customer.credit_card.holder_name,
            #   number: customer.credit_card.number,
            #   expiration_date: customer.credit_card.expiration_date,
            #   cvv: customer.credit_card.cvv,
            #   options: {
            #     make_default: true,
            #     verify_card: true
            #   },
            #   billing_address: {
            #     street_address: customer.billing_address.street_address,
            #     locality: customer.billing_address.locality,
            #     region: customer.billing_address.region,
            #     postal_code: customer.billing_address.postal_code,
            #     extended_address: customer.billing_address.extended_address
            #   }
            # }
          )
          to_customer(response.customer)
        end

        sig do
          params(
            customer: SubscriptionPayment::Entity::Customer
          ).returns(SubscriptionPayment::Entity::Customer)
        end
        def update(customer:)
          response = gateway.customer.update(
            customer.id,
            first_name: customer.first_name,
            email: customer.email,
            phone: customer.phone,
            custom_fields: { document: customer.document }
          )

          to_customer(response.customer)
        end

        private

        def to_customer(from)
          SubscriptionPayment::Entity::Customer.new(
            first_name: from.first_name,
            email: from.email,
            phone: from.phone,
            document: from.custom_fields[:document],
            )
        end
      end
    end
  end
end
  
  