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

    get '/users/:id/edit' do  #edit and show the updated  user
      if !logged_in?
        redirect "/login"
      else
        if @user = current_user
          
          erb :'users/edit' 
        else
          
          redirect "/users"
        end 
      end
      # @user = User.find(params[:id])
      # erb :'users/edit'
    end 

    patch '/users/:id' do  #update 1 user
      user = User.find(params[:id])
      user.update(username: params[:user][:username])
      redirect "/users/#{user.id}"
    end 
 
    delete '/users/:id' do  #delete 1 user
      user = User.find(params[:id])
      user.destroy
      redirect '/'
    end 


 end 