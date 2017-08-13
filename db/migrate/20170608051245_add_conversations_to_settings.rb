class AddConversationsToSettings < ActiveRecord::Migration
  def up
    if table_exists?(:settings)
      execute <<-SQL
      INSERT INTO settings (key, value) VALUES ('feature.conversations', 'true');
      INSERT INTO settings (key, value) VALUES ('main_conversations_rss_url', '');
      INSERT INTO settings (key, value) VALUES ('start_conversation_url', '#');
      SQL
    end
  end

  def down
    execute <<-SQL
      DELETE FROM settings where key IN ('feature.conversations', 'main_conversations_rss_url', 'start_conversation_url')
    SQL
  end
end
