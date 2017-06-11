module Consul
  module Conversations
    class Conversation < ActiveRecord::Base
      include ::Taggable
      include ::Searchable

      acts_as_paranoid column: :hidden_at
      include ::ActsAsParanoidAliases

      belongs_to :author, -> { with_hidden }, class_name: '::User', foreign_key: 'author_id'
      belongs_to :geozone
      has_many :comments, as: :commentable

      validates :title, presence: true
      validates :description, presence: true
      validates :author, presence: true
      validates :polis_id, presence: true

      scope :for_render, -> { includes(:tags) }
      scope :sort_by_created_at, -> { order(created_at: :desc) }
      scope :sort_by_most_viewed, -> { order(views_count: :desc) }
      scope :last_week, -> { where("created_at >= ?", 7.days.ago)}

      def searchable_values
        {
          title              => 'A',
          tag_list.join(' ') => 'B',
          description        => 'D'
        }
      end

      def self.search(terms)
        self.pg_search(terms)
      end
    end
  end
end
