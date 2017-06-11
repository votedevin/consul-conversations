module Consul
  module Conversations
    class Conversation < ActiveRecord::Base
      include ::Taggable

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
      scope :sort_by_created_at, -> { order(:created_at) }
    end
  end
end
