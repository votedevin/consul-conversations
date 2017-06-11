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
        end
      end
    end
  end
end

