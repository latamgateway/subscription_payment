# frozen_string_literal: true

module SubscriptionPayment
  module Interfaces
    extend T::Sig
    extend T::Helpers
    abstract!

    sig do
      params(plan: SubscriptionPayment::Entity::Plan)
        .returns(SubscriptionPayment::Entity::Plan)
    end
    def create_plan(plan); end

    sig do
      params(customer: SubscriptionPayment::Entity::Customer)
        .returns(::SubscriptionPayment::Entity::Customer)
    end
    def create_customer(customer); end

    sig do
      params(credit_card_token: String)
        .returns(String)
    end
    def create_payment_method_nonce(credit_card_token); end

    sig do
      params(credit_card_token: String, plan_id: String)
        .returns(String)
    end
    def create_subscription(credit_card_token, plan_id); end
  end
end
