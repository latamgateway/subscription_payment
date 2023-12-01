module RecurringBilling
  module Entity
    class Customer
      extend T::Sig

      sig { returns(String) }
      attr_accessor :id, :first_name, :last_name, :company, :email, :phone, :fax, :website

      sig { returns(RecurringBilling::Entity::CreditCard) }
      attr_accessor :credit_card

      sig { returns(RecurringBilling::Entity::BillingAddress) }
      attr_accessor :billing_address

      sig do
        params(
          id: String,
          first_name: String,
          last_name: String,
          company: String,
          email: String,
          phone: String,
          fax: String,
          website: String,
          credit_card: CreditCard,
          billing_address: BillingAddress
        ).void
      end
      def initialize(first_name:, last_name:, company:, email:, phone:, fax:, website:, credit_card:, billing_address:)
        @first_name = first_name
        @last_name = last_name
        @company = company
        @email = email
        @phone = phone
        @fax = fax
        @website = website
        @credit_card = credit_card
        @billing_address = billing_address
      end
    end
  end
end