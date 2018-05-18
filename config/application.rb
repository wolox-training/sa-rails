require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module WBooks
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    INITIAL_VARIABLES = [:secrets]

    def secrets #:nodoc:
      @secrets ||= begin
      	secrets = ActiveSupport::OrderedOptions.new
        yaml = config.paths["config/secrets"].first

        if File.exist?(yaml)
          require "erb"
          all_secrets = YAML.load(ERB.new(IO.read(yaml)).result) || {}
          env_secrets = all_secrets[Rails.env]
          secrets.merge!(env_secrets.symbolize_keys) if env_secrets
        end
        secrets.secret_mail_base ||= config.secret_mail_base
        secrets
      end
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
