module RecurringBilling
  module Factories
    class Factory
      # extend T::Sig

      SERVICES = {
        braintree: RecurringBilling::Services::BraintreeService
      }.freeze

      def service
        provider = ENV['PROVIDER']
        service = SERVICES[provider.to_sym]
        service.new
      end
      
    end
  end
end
