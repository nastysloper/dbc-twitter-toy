class Tweet < ActiveRecord::Base
  belongs_to :twitter_user
  validates :twitter_identifier, uniqueness: true
end
