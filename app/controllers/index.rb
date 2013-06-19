get '/' do
  erb :index
end

get '/tweets' do
  redirect "/#{params[:username]}"
end

get '/:username' do |username|
  @user = TwitterUser.find_or_create_by_username(username)
  if @user.tweets_stale?
    begin
      fresh_tweets(@user) 
    rescue
      @error = "Whoops! That user doesn't exist or their tweets are protected."
    end
    @user.tweets_last_pulled = Time.now
  end

  @tweets = @user.tweets.limit(10)

  if @error
    erb :errors
  else
    erb :tweets
  end
end