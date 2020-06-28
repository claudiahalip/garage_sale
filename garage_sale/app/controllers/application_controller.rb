require './config/environment'


class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret,  'top_session'
    register Sinatra::Flash
    set :show_exeptions, false
  end
  
  not_found do
   status 404
   erb :errors
  end 


  get "/" do
    erb :welcome
  end
  

  helpers do 

    def logged_in?
      !!session[:user_id]
    end 

    def current_user
      @current_user ||= User.find_by_id(session[:user_id])
    end 
  end 
 

end
