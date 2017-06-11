class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.string :title, null: false
      t.text :description
      t.string :rss_url
      t.integer :author_id, index: true
      t.datetime :hidden_at, index: true
      t.string :polis_id, null: false
      t.integer :views_count, default: 0, null: false

      t.timestamps null: false
    end

    add_column :tags, :conversations_count, :integer, default: 0

    add_column :conversations, :tsv, :tsvector
    add_index :conversations, :tsv, using: "gin"
  end
end
