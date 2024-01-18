# frozen_string_literal: true

module SubscriptionPaymentApi
  module Interfaces
    extend T::Sig
    extend T::Helpers
    abstract!

    sig do
      params(plan: SubscriptionPaymentApi::Entity::Plan)
        .returns(SubscriptionPaymentApi::Entity::Plan)
    end
    def create_plan(plan); end

    sig do
      params(customer: SubscriptionPaymentApi::Entity::Customer)
        .returns(::SubscriptionPaymentApi::Entity::Customer)
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
