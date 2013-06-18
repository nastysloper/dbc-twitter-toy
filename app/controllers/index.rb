get '/' do
  erb :index
end

get '/tweets' do
  redirect "/#{params[:username]}"
end

get '/:username' do |username|
  @tweets = recent_tweets(username)
  @tweeter = username
  erb :tweets
end