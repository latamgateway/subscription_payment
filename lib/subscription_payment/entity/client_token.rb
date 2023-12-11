# frozen_string_literal: true

module SubscriptionPayment
  module Entity
    class ClientToken
      extend T::Sig

      sig { returns(String) }
      attr_accessor :client_token

      sig do
        params(
          client_token: String
        ).void
      end
      def initialize(client_token:)
        @client_token = client_token
      end
    end
  end
end
