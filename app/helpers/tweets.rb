def fresh_tweets(user)
  tweets_json = Twitter.user_timeline(user.username)
  @tweets_array = []
  tweets_json.each do |twitter_data|
    tweet_args = {}
    tweet_args[:date_posted] = twitter_data.attrs[:created_at]
    tweet_args[:tweet] = twitter_data.attrs[:text]
    tweet_args[:twitter_user] = user
    tweet_args[:twitter_identifier] = twitter_data.attrs[:id_str]
    @tweets_array << Tweet.create(tweet_args)
  end
  @tweets_array
end

def refresh_tweets(user)
  begin
    fresh_tweets(user) 
  rescue
    @error = "Whoops! That user doesn't exist or their tweets are protected."
  end
end