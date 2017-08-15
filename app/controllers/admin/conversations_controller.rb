module Admin
  class ConversationsController < BaseController
    has_filters %w{all}, only: :index

    def index
      @conversations = Consul::Conversations::Conversation
                        .only_hidden.send(@current_filter)
                        .order(hidden_at: :desc)
                        .page(params[:page])
    end

    def restore
      conversation = Consul::Conversations::Conversation.with_hidden.find(params[:id])
      conversation.restore

      Activity.log(current_user, :restore, conversation)
      redirect_to request.query_parameters.merge(action: :index)
    end
  end
end
