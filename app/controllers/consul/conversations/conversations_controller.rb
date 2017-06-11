module Consul
  module Conversations
    class ConversationsController < ::ApplicationController
      include ::FeatureFlags
      include ::CommentableActions

      before_action :parse_tag_filter, only: :index

      feature_flag :conversations

      skip_authorization_check

      has_orders %w{created_at}, only: :index

      def show
        @conversation = ConversationDecorator.new(
          resource_model.for_render.find(params[:id])
        )
      end

      def edit
        @conversation = resource_model.find(params[:id])
      end

      def update
        @conversation = resource_model.find(params[:id])
        if @conversation.update_attributes(conversation_params)
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
    end
  end
end
