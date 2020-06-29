require './config/environment'

class UserController < ApplicationController

    get '/signup' do
      "sign up"
      erb :'users/new'
    end

    post '/signup' do
      user = User.new(params[:user])
      if user.save 
        session[:user_id]=user.id
        redirect "/users/#{user.id}"
      else
        @errors = user.errors.full_messages.join(", ")
        erb:'users/new'
      end 
    end
    
    get '/login' do 
      erb :'users/login'
    end 

    post '/login' do
      user = User.find_by_username(params[:user][:username])
      if user && user.authenticate(params[:user][:password])
        session[:user_id] = user.id
        redirect "/users/#{user.id}"
      else
        flash[:message] = "You have to type in username AND password in order to login"
        erb :'users/login'
      end 
    end


    get '/logout' do
      session.clear
      redirect '/'
    end
    
    get '/users' do
      @users = User.all
      erb :'users/index'
    end 
    
    get '/users/:id' do  
      @user = User.find_by_id(params[:id])
      erb :'users/show'
    end 

    get '/users/:id/edit' do 
      if !logged_in?
        #flash[:message] = "You have to login!"
        redirect "/login"
      end
      @user = current_user
      erb :'users/edit' 
    end 

    patch '/users/:id' do 
      user = User.find(params[:id])
      if logged_in?
        user.update(username: params[:user][:username])
      else
        flash[:message] = "Not yours to edit!!!"
      end
      redirect "/users/#{user.id}" 
    end 
    
 
    delete '/users/:id' do 
      user = User.find(params[:id])
      if logged_in? && current_user == user
        user.destroy
        redirect '/'
      # else
      #   flash[:message] = "Not yours to delete!!!" 
      #   redirect '/'
      end
     
    end 


 end 