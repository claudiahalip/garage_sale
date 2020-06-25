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
        #add errors
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
        redirect '/'
      end 
    end


    get '/logout' do
      "logout"
      session.clear
      redirect '/'
    end
    
    get '/users' do
      @users = User.all
      erb :'users/index'
    end 
    
    get '/users/:id' do  #show 1 user
      @user = User.find_by_id(params[:id])
      erb :'users/show'
    end 

    get '/users/:id/edit' do 
      if !logged_in?
        redirect "/login"
      end
      @user = current_user
      erb :'users/edit' 
    end 

    patch '/users/:id' do  #update 1 user
      user = User.find(params[:id])
      if !logged_in?
        user.update(username: params[:user][:username])
        redirect "/users/#{user.id}"
      end
    end 
 
    delete '/users/:id' do  #delete 1 user
      user = User.find(params[:id])
      if !logged_in?
        user.destroy
        redirect '/'
      end 
    end 


 end 