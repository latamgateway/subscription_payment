module RecurringBilling
  module Services
    class Factory
      # extend T::Sig

      SERVICES = {
        braintree: RecurringBilling::Interfaces::BraintreeService.new
      }.freeze

      def initialize
        provider = ENV['PROVIDER']
        @service = SERVICES[provider.to_sym]
      end
      
    end
  end
end
