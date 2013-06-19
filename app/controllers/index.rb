get '/' do
  erb :index
end

get '/tweets' do
  redirect "/#{params[:username]}"
end

get '/:username' do |username|
  @user = TwitterUser.find_or_create_by_username(username)
  if @user.tweets_stale?
    refresh_tweets(@user)
    @user.tweets_last_pulled = Time.now
    @user.save
  end

  @tweets = @user.tweets.limit(10)

  if @error
    erb :errors
  else
    erb :tweets
  end
end