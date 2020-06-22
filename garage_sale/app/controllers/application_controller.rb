require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :welcome
  end

  # helpers do 

  #   def logged_in?
  #     !!session[:email]
  #   end 

  #   def login(email, password)
  #     user = User.find_by(email)
  #     if user  && user.authenticate(password)
  #       session[:email] = user.email
  #     else
  #       redirect '/login'
  #     end 

  #   end 

  #   def logout 
  #     session.clear
  #   end 
  # end 

end
