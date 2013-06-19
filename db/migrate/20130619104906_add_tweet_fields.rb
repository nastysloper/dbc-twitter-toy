class AddTweetFields < ActiveRecord::Migration
  def change
    add_column :tweets, :twitter_identifier, :string
  end
end
