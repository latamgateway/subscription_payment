# frozen_string_literal: true

module SubscriptionPaymentApi
  module Providers
    module Braintree
      class Customer < SubscriptionPaymentApi::Providers::Braintree::Base
        extend T::Sig

        sig do
          params(
            id: String
          ).returns(SubscriptionPaymentApi::Entity::Customer)
        end
        def find(id:)
          customer = gateway.customer.find(id)
          to_customer(customer)
        rescue => e
          raise SubscriptionPaymentApi::Exceptions::GeneralError.new(e.message)
        end

        sig do
          params(
            customer: SubscriptionPaymentApi::Entity::Customer
          ).returns(SubscriptionPaymentApi::Entity::Customer)
        end
        def create(customer:)
          response = gateway.customer.create(
            first_name: customer.first_name,
            email: customer.email,
            phone: customer.phone,
            custom_fields: { document: customer.document }
          )

          raise SubscriptionPaymentApi::Exceptions::GeneralError.new(response.message) \
            unless response.success?

          to_customer(response.customer)
        end

        sig do
          params(
            customer: SubscriptionPaymentApi::Entity::Customer
          ).returns(SubscriptionPaymentApi::Entity::Customer)
        end
        def update(customer:)
          response = gateway.customer.update(
            customer.id,
            first_name: customer.first_name,
            email: customer.email,
            phone: customer.phone,
            custom_fields: { document: customer.document }
          )

          raise SubscriptionPaymentApi::Exceptions::GeneralError.new(response.message) \
            unless response.success?

          to_customer(response.customer)
        end
      end
    end
  end
end
  
  