require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :session
    set :session_secret,  'top_secret'
  end

  get "/" do
    erb :welcome
  end

 

end
