# frozen_string_literal: true

require_relative "lib/subscription_payment/version"

Gem::Specification.new do |spec|
  spec.name = "subscription_payment"
  spec.version = SubscriptionPayment::VERSION
  spec.authors = ["Latam Gateway"]
  spec.email = ["developers@latamgateway.com"]

  spec.summary = "A Ruby gem for subscription payments that centralizes and streamlines the entire
                  recurring payment logic within a company. This gem supports multiple subscription payments providers,
                  offering a versatile solution for businesses to seamlessly integrate and manage subscriptions."
  spec.description = "Simplify the complexities of subscription payments in Ruby applications with this gem.
                      It provides a modular architecture, enabling easy integration with various subscription payment
                      service providers. Manage subscriptions effortlessly, securely handle transactions,
                      and centralize recurring payment logic. Choose from a range of payment providers,
                      tailor the solution to your business needs, and streamline the entire lifecycle of
                      recurring payments with this robust and highly customizable gem."
  spec.homepage = "https://github.com/latamgateway/subscription_payment"
  spec.required_ruby_version = ">= 2.4.0"

  spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/latamgateway/subscription_payment"
  spec.metadata["changelog_uri"] = "https://github.com/latamgateway/subscription_payment/blob/develop/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) || f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency("braintree")
  spec.add_dependency("sorbet-runtime")

  spec.add_development_dependency("dotenv")
  spec.add_development_dependency("rake")
  spec.add_development_dependency("rspec")
  spec.add_development_dependency("rubocop")
  spec.add_development_dependency("sorbet-static")
  spec.add_development_dependency("pry-byebug")
end
