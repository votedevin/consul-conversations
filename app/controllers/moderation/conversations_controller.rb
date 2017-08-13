module Moderation
  class ConversationsController < BaseController
    include ModerateActions

    has_filters %w{all}, only: :index
    has_orders %w{created_at}, only: :index

    before_action :load_resources, only: %i(index moderate)

    load_and_authorize_resource class: 'Consul::Conversations::Conversation'

    private

    def resource_model
      Consul::Conversations::Conversation
    end

    def resource_name
      'conversations'
    end

    def current_ability
      @current_ability ||= Consul::Conversations::ConversationAbility.new(current_user)
    end
  end
end
