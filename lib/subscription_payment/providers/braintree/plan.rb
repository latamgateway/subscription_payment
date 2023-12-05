# frozen_string_literal: true

module SubscriptionPayment
  module Providers
    module Braintree
      class Plan
        extend T::Sig

        sig do
          params(
            gateway: ::Braintree::Gateway,
            plan: SubscriptionPayment::Entity::Plan
          ).returns(::Braintree::SuccessfulResult)
        end
        def create(gateway:, plan:)
          payload = {
            name: plan.name,
            billing_frequency: plan.frequency,
            currency_iso_code: plan.currency,
            price: plan.price
          }

          payload[:id] = plan.id unless plan.id.nil?

          gateway.plan.create(payload)
        end

        sig do
          params(
            gateway: ::Braintree::Gateway,
            plan_id: String
          ).returns(SubscriptionPayment::Entity::Plan)
        end
        def find(gateway:, plan_id:)
          begin
            plan = gateway.plan.find(plan_id)
            to_plan(plan)
          rescue ::Braintree::NotFoundError => e
            # Add log
            raise SubscriptionPayment::Exceptions::GeneralError
          end
        end

        private

        def to_plan(braintree_plain)
          SubscriptionPayment::Entity::Plan.new(
            name: braintree_plain.name,
            frequency: braintree_plain.billing_frequency,
            currency: braintree_plain.currency_iso_code,
            price: braintree_plain.price,
            id: braintree_plain.id,
            billing_day_of_month: braintree_plain.billing_day_of_month,
            number_of_billing_cycles: braintree_plain.number_of_billing_cycles,
            description: braintree_plain.description,
          )
        end
      end
    end
  end
end

