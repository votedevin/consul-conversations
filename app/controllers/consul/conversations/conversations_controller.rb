module Consul
  module Conversations
    class ConversationsController < ::ApplicationController
      include ::FeatureFlags
      include ::CommentableActions

      before_action :parse_tag_filter, only: :index
      before_action :authenticate_user!, except: %i(index show)

      feature_flag :conversations

      skip_authorization_check only: %i(index show)
      load_and_authorize_resource only: %i(new edit update create)

      has_orders %w{most_viewed created_at}, only: :index

      helper_method :taggables_path

      def show
        @conversation = ConversationDecorator.new(
          resource_model.for_render.find(params[:id])
        )

        @conversation.update(views_count: @conversation.views_count + 1)
      end

      def update
        if resource.update_attributes(conversation_params)
          redirect_to conversation_url(@conversation), notice: t("flash.actions.update.#{resource_name.underscore}")
        else
          render :edit
        end
      end

      private

      def resource_model
        Conversation
      end

      def resource_name
        @resource_name ||= resource_model.to_s.downcase.split('::').last
      end

      def set_resource_votes(*args)
      end

      def conversation_params
        params
          .require(:conversation)
          .permit(:title,
                  :description,
                  :tag_list,
                  :rss_url,
                  :polis_id)
      end

      # NOTE: override helper for conversations for construct right path
      def taggables_path(_taggable_type, tag_name)
        conversations_path(search: tag_name)
      end

      def current_ability
        @current_ability ||= ConversationAbility.new(current_user)
      end
    end
  end
end
