module Consul
  module Conversations
    class Ability
      include CanCan::Ability

      def initialize(user)
        if user.administrator? || user.moderator?
          can :new, Conversation
          can :edit, Conversation
          can :update, Conversation
        end
      end
    end
  end
end

