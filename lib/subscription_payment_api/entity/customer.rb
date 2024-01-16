# frozen_string_literal: true

module SubscriptionPaymentApi
  module Entity
    class Customer
      extend T::Sig

      sig { returns(String) }
      attr_accessor :first_name, :email, :phone, :document, :id

      sig { returns(T.nilable(T::Array[SubscriptionPaymentApi::Entity::Address])) }
      attr_accessor :addresses

      sig { returns(T.nilable(T::Array[SubscriptionPaymentApi::Entity::CreditCard])) }
      attr_accessor :credit_cards

      sig do
        params(
          first_name: String,
          email: String,
          phone: String,
          document: String,
          id: T.nilable(String),
          addresses: T.nilable(T::Array[SubscriptionPaymentApi::Entity::Address]),
          credit_cards: T.nilable(T::Array[SubscriptionPaymentApi::Entity::CreditCard])
        ).void
      end
      def initialize(
        first_name:,
        email:,
        phone:,
        document:,
        id: nil,
        addresses: nil,
        credit_cards: nil
      )
        @first_name = first_name
        @email = email
        @phone = phone
        @document = document
        @id = id
        @addresses = addresses
        @credit_cards = credit_cards
      end
    end
  end
end
