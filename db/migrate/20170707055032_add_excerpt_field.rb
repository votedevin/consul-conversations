class AddExcerptField < ActiveRecord::Migration
  def change
    add_column :conversations, :excerpt, :text
  end
end
