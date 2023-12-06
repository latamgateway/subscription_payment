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
          begin
            gateway.customer.create(
              first_name: customer.first_name,
              email: customer.email,
              phone: customer.phone,
              custom_fields: { document: customer.document },
              credit_card: {
                cardholder_name: customer.credit_card.holder_name,
                number: customer.credit_card.number,
                expiration_date: customer.credit_card.expiration_date,
                cvv: customer.credit_card.cvv,
                options: {
                  make_default: true,
                  verify_card: true
                },
                billing_address: {
                  street_address: customer.billing_address.street_address,
                  locality: customer.billing_address.locality,
                  region: customer.billing_address.region,
                  postal_code: customer.billing_address.postal_code,
                  extended_address: customer.billing_address.extended_address
                }
              }
            )
          rescue ::Braintree::ErrorResult => e
            @logger.debug("Passei aqui no logger da GEM")
            raise SubscriptionPayment::Exceptions::GeneralError
          end
        end
      end
    end
  end
end
  
  