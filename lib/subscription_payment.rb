# frozen_string_literal: true

# General
require "sorbet-runtime"
require "braintree"
require "logger"
require "subscription_payment/version"
require "subscription_payment/exceptions/general_error"

# Entities
require "subscription_payment/entity/plan"
require "subscription_payment/entity/billing_address"
require "subscription_payment/entity/credit_card"
require "subscription_payment/entity/customer"

# Providers
# Braintree
require "subscription_payment/providers/braintree/gateway"
require "subscription_payment/providers/braintree/plan"
require "subscription_payment/providers/braintree/customer"
require "subscription_payment/providers/braintree/credit_card_token"
require "subscription_payment/providers/braintree/subscription"

# Interfaces
require "subscription_payment/interfaces/base"

# Services
require "subscription_payment/services/braintree_service"

# Factory
require "subscription_payment/factories/factory"

# Services
require "subscription_payment/gateway/recurring"

# The main module
module SubscriptionPayment
  @logger = Logger.new(STDOUT)
  @logger.level = Logger::DEBUG
end
