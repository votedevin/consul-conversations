require 'rails/engine'

module Consul
  module Conversations
    class Engine < ::Rails::Engine
      initializer "consul_conversations_routes", before: :load_config_initializers do |app|
        Rails.application.routes.prepend do
          scope module: 'consul/conversations' do
            resources :conversations
          end

          namespace :moderation do
            resources :conversations, only: :index do
              collection do
                put :moderate
              end
            end
          end
        end
      end

      initializer 'consul_conversations', before: :load_init_rb do |app|
        app.config.paths['db/migrate'].concat(config.paths['db/migrate'].expanded)
      end
    end
  end
end
