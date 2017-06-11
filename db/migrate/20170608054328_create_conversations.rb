class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.string :title, null: false
      t.text :description
      t.string :rss_url
      t.integer :author_id, index: true
      t.datetime :hidden_at, index: true
      t.string :polis_id, null: false

      t.timestamps null: false
    end

    add_column :tags, :conversations_count, :integer, default: 0
  end
end
