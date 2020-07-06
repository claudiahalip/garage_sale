require './config/environment'

class UserController < ApplicationController

    get '/signup' do
      if logged_in?
        redirect "/users/#{current_user.id}"
      else
        erb :'users/new'
      end 
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
      if logged_in?
        redirect "/users/#{current_user.id}"
      else
        erb :'users/login'
      end 
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
      if logged_in?
        session.clear
        redirect '/'
      else
        redirect '/login'
      end 
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
        flash[:message] = "You have to login!"
        redirect "/login"
      end
      @user = current_user
      erb :'users/edit' 
    end 

    patch '/users/:id' do 
      user = User.find(params[:id])
      if logged_in?  && user == current_user
        user.update(username: params[:user][:username])
        redirect "/users/#{user.id}"
      else
        flash[:message] = "Not yours to edit!!!"
        redirect "/users"
      end
       
    end 
    
 
    delete '/users/:id' do 
      user = User.find(params[:id])
      if logged_in? && current_user == user
        session.clear
        user.destroy
        redirect '/'
      else
        flash[:message] = "Not yours to delete!!!" 
        redirect '/login'
      end
     
    end 


 end 