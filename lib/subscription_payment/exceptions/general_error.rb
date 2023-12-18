# frozen_string_literal: true

module SubscriptionPayment
  module Exceptions
    class GeneralError < StandardError
      def initialize(msg = nil)
        super(msg)
      end
    end
  end
end
