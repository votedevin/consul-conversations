class AddConversationsToSettings < ActiveRecord::Migration
  def up
    execute <<-SQL
      INSERT INTO settings (key, value) VALUES ('feature.conversations', 'true');
      INSERT INTO settings (key, value) VALUES ('main_conversations_rss_url', '');
      INSERT INTO settings (key, value) VALUES ('start_conversation_url', '#');
    SQL
  end
end
