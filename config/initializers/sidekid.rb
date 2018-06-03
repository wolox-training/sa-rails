require 'sidekiq'
# require 'sidekiq-status'

Sidekiq.configure_client do |config|
 # config.client_middleware do |chain|
 #   chain.add Sidekiq::Status::ClientMiddleware
 # end
  config.redis = { url: 'redis://localhost:6379' }
end

Sidekiq.configure_server do |config|
 # config.server_middleware do |chain|
 #   chain.add Sidekiq::Status::ServerMiddleware, expiration: 30.minutes
 # end
 # config.client_middleware do |chain|
 #   chain.add Sidekiq::Status::ClientMiddleware
 # end
  config.redis = { url: 'redis://localhost:6379' }
end
