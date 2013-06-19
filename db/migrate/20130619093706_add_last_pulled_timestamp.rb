class AddLastPulledTimestamp < ActiveRecord::Migration
  def change
    add_column :twitter_users, :tweets_last_pulled, :timestamp
  end
end