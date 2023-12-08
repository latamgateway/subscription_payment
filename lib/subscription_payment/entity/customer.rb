# frozen_string_literal: true

module SubscriptionPayment
  module Entity
    class Customer
      extend T::Sig

      sig { returns(String) }
      attr_accessor :first_name, :email, :phone, :document, :id

      sig do
        params(
          first_name: String,
          email: String,
          phone: String,
          document: String,
          id: T.nilable(String),
        ).void
      end
      def initialize(
        first_name:,
        email:,
        phone:,
        document:,
        id: nil
        )
        @first_name = first_name
        @email = email
        @phone = phone
        @document = document
        @id = id
      end
    end
  end
end
