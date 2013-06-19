get '/' do
  erb :index
end

get '/tweets' do
  redirect "/#{params[:username]}"
end

get '/:username' do |username|
  @user = TwitterUser.find_or_create_by_username(username)
  if @user.tweets.empty?
    fresh_tweets = fresh_tweets(username)
    fresh_tweets.each do |tweet|
      Tweet.create(tweet: tweet, twitter_user: @user)
    end
  end

  @tweets = @user.tweets.limit(10)
  erb :tweets
end