def fresh_tweets(username)
  tweets_json = Twitter.user_timeline(username)
  @tweets_array = []
  tweets_json.each do |twitter_data|
    @tweets_array << twitter_data[:text]
  end
  @tweets_array
end