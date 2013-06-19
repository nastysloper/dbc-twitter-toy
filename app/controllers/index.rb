get '/' do
  erb :index
end

get '/tweets' do
  redirect "/#{params[:username]}"
end

get '/:username' do |username|
  @user = TwitterUser.find_or_create_by_username(username)
  if @user.tweets_stale?
    puts @user.tweets_stale?
    fresh_tweets = fresh_tweets(username)
    @user.tweets_last_pulled = Time.now
  end

  @tweets = @user.tweets.limit(10)
  erb :tweets
end