require 'pry'

class TwitterUser < ActiveRecord::Base
  has_many :tweets

  def tweets_stale?
    return true if self.tweets_last_pulled.nil?
    cache_age(self) > 15
  end

  private
    def cache_age(user)
      cache_age = (Time.now - user.tweets_last_pulled)/60
    end
end
