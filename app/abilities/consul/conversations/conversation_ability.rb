module Consul
  module Conversations 
    class ConversationAbility
      include CanCan::Ability

      def initialize(user)
        user = user || ::User.new
        if user.administrator? || user.moderator?
          can :new, Conversation
          can :edit, Conversation
          can :update, Conversation
          can :create, Conversation
          can :index, Conversation
          can :moderate, Conversation
          can :hide, Conversation
        end
      end
    end
  end
end

