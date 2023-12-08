# frozen_string_literal: true

module SubscriptionPayment
  module Providers
    module Braintree
      class Plan < SubscriptionPayment::Providers::Braintree::Base
        extend T::Sig

        sig do
          params(
            id: String
          ).returns(SubscriptionPayment::Entity::Plan)
        end
        def find(id:)
          plan = gateway.plan.find(id)
          to_plan(plan)
        end

        sig do
          params(
            plan: SubscriptionPayment::Entity::Plan
          ).returns(SubscriptionPayment::Entity::Plan)
        end
        def create(plan:)
          payload = plan_payload(plan)
          response = gateway.plan.create(payload)
          puts response.plan
          to_plan(response.plan)
        end

        sig do
          params(
            plan: SubscriptionPayment::Entity::Plan
          ).returns(SubscriptionPayment::Entity::Plan)
        end
        def update(plan:)
          payload = plan_payload(plan)
          payload.delete(:id)
          payload.delete(:billing_frequency)

          response = gateway.plan.update(plan.id, payload)
          to_plan(response.plan)
        end

        private

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

        def plan_payload(plan)
          payload = {
            name: plan.name,
            billing_frequency: plan.frequency,
            currency_iso_code: plan.currency,
            price: plan.price
          }

          payload[:billing_day_of_month] = plan.billing_day_of_month unless plan.billing_day_of_month.nil?
          payload[:number_of_billing_cycles] = plan.number_of_billing_cycles unless plan.number_of_billing_cycles.nil?
          payload[:description] = plan.description unless plan.description.nil?
          payload[:id] = plan.id unless plan.id.nil?
          payload
        end
      end
    end
  end
end

