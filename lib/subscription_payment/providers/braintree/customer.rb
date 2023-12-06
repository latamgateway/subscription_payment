# frozen_string_literal: true

module SubscriptionPayment
  module Providers
    module Braintree
      class Customer
        extend T::Sig

        sig do
          params(
            gateway: ::Braintree::Gateway,
            customer: SubscriptionPayment::Entity::Customer
          ).returns(::Braintree::SuccessfulResult)
        end
        def create(gateway:, customer:)
          gateway.customer.create(
            first_name: customer.first_name,
            last_name: customer.last_name,
            company: customer.company,
            email: customer.email,
            phone: customer.phone,
            fax: customer.fax,
            website: customer.website,
            credit_card: {
              cardholder_name: customer.credit_card.cardholder_name,
              number: customer.credit_card.number,
              expiration_date: customer.credit_card.expiration_date,
              options: {
                make_default: true,
                verify_card: true
              },
              billing_address: {
                first_name: customer.billing_address.first_name,
                last_name: customer.billing_address.last_name,
                company: customer.billing_address.company,
                street_address: customer.billing_address.street_address,
                locality: customer.billing_address.locality,
                region: customer.billing_address.region,
                postal_code: customer.billing_address.postal_code
              }
            }
          )
        end
      end
    end
  end
end
  
  