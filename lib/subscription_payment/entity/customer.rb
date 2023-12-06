# frozen_string_literal: true

module SubscriptionPayment
  module Entity
    class Customer
      extend T::Sig

      sig { returns(String) }
      attr_accessor :first_name, :last_name, :company, :email, :phone, :fax, :website, :id, :credit_card_token

      sig { returns(SubscriptionPayment::Entity::CreditCard) }
      attr_accessor :credit_card

      sig { returns(SubscriptionPayment::Entity::BillingAddress) }
      attr_accessor :billing_address

      sig do
        params(
          first_name: String,
          last_name: String,
          company: String,
          email: String,
          phone: String,
          credit_card: CreditCard,
          billing_address: BillingAddress,
          fax: T.nilable(String),
          website: T.nilable(String),
          id: T.nilable(String),
          credit_card_token: T.nilable(String)
        ).void
      end
      def initialize(
        first_name:, 
        last_name:, 
        company:, 
        email:, 
        phone:, 
        credit_card:, 
        billing_address:, 
        fax: nil, 
        website: nil, 
        id: nil,
        credit_card_token: nil
        )
        @first_name = first_name
        @last_name = last_name
        @company = company
        @email = email
        @phone = phone
        @credit_card = credit_card
        @billing_address = billing_address
        @fax = fax
        @website = website
        @id = id
        @credit_card_token = credit_card_token
      end
    end
  end
end
