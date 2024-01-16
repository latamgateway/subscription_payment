# frozen_string_literal: true

module SubscriptionPaymentApi
  module Exceptions
    class GeneralError < StandardError
      def initialize(msg = nil)
        super(msg)
      end
    end
  end
end
