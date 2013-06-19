class TwitterUser < ActiveRecord::Base
  has_many :tweets

  def tweets_stale?
    self.tweets_last_pulled ? cache_age(self) : true
  end

  private
    def cache_age(user)
      cache_age = (Time.now - user.tweets_last_pulled)/60
      return cache_age > 1
    end
end
