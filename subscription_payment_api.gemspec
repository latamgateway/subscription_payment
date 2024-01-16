# -*- encoding: utf-8 -*-
# stub: subscription_payment 1.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "subscription_payment_api".freeze
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "allowed_push_host" => "TODO: Set to your gem server 'https://example.com'", "changelog_uri" => "https://github.com/latamgateway/subscription_payment/blob/develop/CHANGELOG.md", "homepage_uri" => "https://github.com/latamgateway/subscription_payment", "source_code_uri" => "https://github.com/latamgateway/subscription_payment" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Latam Gateway".freeze]
  s.bindir = "exe".freeze
  s.date = "2023-12-16"
  s.description = "Simplify the complexities of subscription payments in Ruby applications with this gem.\n                      It provides a modular architecture, enabling easy integration with various subscription payment\n                      service providers. Manage subscriptions effortlessly, securely handle transactions,\n                      and centralize recurring payment logic. Choose from a range of payment providers,\n                      tailor the solution to your business needs, and streamline the entire lifecycle of\n                      recurring payments with this robust and highly customizable gem.".freeze
  s.email = ["developers@latamgateway.com".freeze]
  s.files = [".rspec".freeze, ".rubocop.yml".freeze, ".ruby-version".freeze, "CHANGELOG.md".freeze, "Gemfile".freeze, "Gemfile.lock".freeze, "README.md".freeze, "Rakefile".freeze, "lib/config/boot.rb".freeze, "lib/subscription_payment.rb".freeze, "lib/subscription_payment/entity/address.rb".freeze, "lib/subscription_payment/entity/client_token.rb".freeze, "lib/subscription_payment/entity/credit_card.rb".freeze, "lib/subscription_payment/entity/customer.rb".freeze, "lib/subscription_payment/entity/plan.rb".freeze, "lib/subscription_payment/entity/subscription.rb".freeze, "lib/subscription_payment/entity/transaction.rb".freeze, "lib/subscription_payment/exceptions/general_error.rb".freeze, "lib/subscription_payment/factories/factory.rb".freeze, "lib/subscription_payment/interfaces/base.rb".freeze, "lib/subscription_payment/main/address.rb".freeze, "lib/subscription_payment/main/client_token.rb".freeze, "lib/subscription_payment/main/credit_card.rb".freeze, "lib/subscription_payment/main/customer.rb".freeze, "lib/subscription_payment/main/payment_method.rb".freeze, "lib/subscription_payment/main/plan.rb".freeze, "lib/subscription_payment/main/recurring.rb".freeze, "lib/subscription_payment/main/subscription.rb".freeze, "lib/subscription_payment/main/webhook.rb".freeze, "lib/subscription_payment/providers/braintree/address.rb".freeze, "lib/subscription_payment/providers/braintree/base.rb".freeze, "lib/subscription_payment/providers/braintree/client_token.rb".freeze, "lib/subscription_payment/providers/braintree/credit_card.rb".freeze, "lib/subscription_payment/providers/braintree/customer.rb".freeze, "lib/subscription_payment/providers/braintree/gateway.rb".freeze, "lib/subscription_payment/providers/braintree/payment_method.rb".freeze, "lib/subscription_payment/providers/braintree/plan.rb".freeze, "lib/subscription_payment/providers/braintree/subscription.rb".freeze, "lib/subscription_payment/providers/braintree/webhook.rb".freeze, "lib/subscription_payment/services/braintree/address.rb".freeze, "lib/subscription_payment/services/braintree/client_token.rb".freeze, "lib/subscription_payment/services/braintree/credit_card.rb".freeze, "lib/subscription_payment/services/braintree/customer.rb".freeze, "lib/subscription_payment/services/braintree/gateway.rb".freeze, "lib/subscription_payment/services/braintree/payment_method.rb".freeze, "lib/subscription_payment/services/braintree/plan.rb".freeze, "lib/subscription_payment/services/braintree/subscription.rb".freeze, "lib/subscription_payment/services/braintree/webhook.rb".freeze, "lib/subscription_payment/services/braintree_service.rb".freeze, "lib/subscription_payment/version.rb".freeze]
  s.homepage = "https://github.com/latamgateway/subscription_payment".freeze
  s.required_ruby_version = Gem::Requirement.new(">= 2.4.0".freeze)
  s.rubygems_version = "3.2.22".freeze
  s.summary = "A Ruby gem for subscription payments that centralizes and streamlines the entire recurring payment logic within a company. This gem supports multiple subscription payments providers, offering a versatile solution for businesses to seamlessly integrate and manage subscriptions.".freeze

  s.installed_by_version = "3.2.22" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<braintree>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<sorbet-runtime>.freeze, [">= 0"])
    s.add_development_dependency(%q<dotenv>.freeze, [">= 0"])
    s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
    s.add_development_dependency(%q<rubocop>.freeze, [">= 0"])
    s.add_development_dependency(%q<sorbet-static>.freeze, [">= 0"])
    s.add_development_dependency(%q<pry-byebug>.freeze, [">= 0"])
  else
    s.add_dependency(%q<braintree>.freeze, [">= 0"])
    s.add_dependency(%q<sorbet-runtime>.freeze, [">= 0"])
    s.add_dependency(%q<dotenv>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, [">= 0"])
    s.add_dependency(%q<rubocop>.freeze, [">= 0"])
    s.add_dependency(%q<sorbet-static>.freeze, [">= 0"])
    s.add_dependency(%q<pry-byebug>.freeze, [">= 0"])
  end
end
