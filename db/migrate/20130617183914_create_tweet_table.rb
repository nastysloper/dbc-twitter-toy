class CreateTweetTable < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.text :tweet
      t.datetime :date_posted
      t.references :twitter_user
      t.timestamps
    end
  end
end
