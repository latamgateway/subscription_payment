module RecurringBilling
  module Entity
    class BillingAddress
      extend T::Sig

      sig { returns(String) }
      attr_accessor :first_name, :last_name, :company, :street_address, :locality, :region, :postal_code

      sig do
        params(
          first_name: String,
          last_name: String,
          company: String,
          street_address: String,
          locality: String,
          region: String,
          postal_code: String
        ).void
      end
      def initialize(first_name:, last_name:, company:, street_address:, locality:, region:, postal_code:)
        @first_name = first_name
        @last_name = last_name
        @company = company
        @street_address = street_address
        @locality = locality
        @region = region
        @postal_code = postal_code
      end
    end
  end
end