# frozen_string_literal: true

module SubscriptionPaymentApi
  module Providers
    module Braintree
      class Plan < SubscriptionPaymentApi::Providers::Braintree::Base
        extend T::Sig

        sig do
          params(
            id: String
          ).returns(SubscriptionPaymentApi::Entity::Plan)
        end
        def find(id:)
          plan = gateway.plan.find(id)
          to_plan(plan)
        rescue => e
          raise SubscriptionPaymentApi::Exceptions::GeneralError.new(e.message)
        end

        sig do
          params(
            plan: SubscriptionPaymentApi::Entity::Plan
          ).returns(SubscriptionPaymentApi::Entity::Plan)
        end
        def create(plan:)
          payload = plan_payload(plan)
          response = gateway.plan.create(payload)

          raise SubscriptionPaymentApi::Exceptions::GeneralError.new(response.message) \
            unless response.success?

          to_plan(response.plan)
        end

        sig do
          params(
            plan: SubscriptionPaymentApi::Entity::Plan
          ).returns(SubscriptionPaymentApi::Entity::Plan)
        end
        def update(plan:)
          payload = plan_payload(plan)
          payload.delete(:id)
          payload.delete(:billing_frequency)

          response = gateway.plan.update(plan.id, payload)

          raise SubscriptionPaymentApi::Exceptions::GeneralError.new(response.message) \
            unless response.success?

          to_plan(response.plan)
        end

        private

        def plan_payload(plan)
          payload = {
            name: plan.name,
            billing_frequency: plan.frequency,
            currency_iso_code: plan.currency,
            price: plan.price
          }

          payload[:billing_day_of_month] = plan.billing_day_of_month unless plan.billing_day_of_month.nil?
          payload[:number_of_billing_cycles] = plan.number_of_billing_cycles.nil? ? nil : plan.number_of_billing_cycles
          payload[:description] = plan.description unless plan.description.nil?
          payload[:id] = plan.id unless plan.id.nil?
          payload
        end
      end
    end
  end
end

