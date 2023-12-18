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
        rescue => e
          raise SubscriptionPayment::Exceptions::GeneralError.new(e.message)
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
          )

          raise SubscriptionPayment::Exceptions::GeneralError.new(response.message) \
            unless response.success?

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

          raise SubscriptionPayment::Exceptions::GeneralError.new(response.message) \
            unless response.success?

          to_customer(response.customer)
        end
      end
    end
  end
end
  
  