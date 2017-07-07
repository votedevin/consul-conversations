module Consul
  module Conversations
    class ConversationDecorator < SimpleDelegator
      POLIS_SOURCE_TAG = '{polis}'.freeze
      POLIS_TAG = "<div class='polis' data-conversation_id='%{id}'></div>".freeze

      def description_with_polis
        polis = POLIS_TAG % {id: polis_id}

        if description.include?(POLIS_SOURCE_TAG)
          description.sub(POLIS_SOURCE_TAG, polis)
        else
          description << polis
        end
      end

      def description_for_list
        if excerpt.present?
          excerpt
        else
          text = description.sub(POLIS_SOURCE_TAG, ''.freeze)
          text.gsub(/<p>[\s$]*<\/p>/, ''.freeze)
        end
      end
    end
  end
end
