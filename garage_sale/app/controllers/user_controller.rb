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
        redirect '/login'
      else
        #add errors
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
        redirect '/user/dashboard'
      else
        redirect '/'
      end 
    end



    get '/logout' do
      "logout"
      session.clear
      redirect '/'
    end

    get '/user/dashboard' do 
      "here is dashboard"
      erb :'users/index'
    end 
    
    
   get 'users/:id' do  #show 1 user
      @user = User.find(params[:id])
      erb :'users/show'
    end 


    get '/users/:id/edit' do  #edit and show the updated  user
       
    end 

    post '/users' do  #create 1 user
    
    end 

    patch '/users/:id' do  #update 1 user
  
    end 
 
    delete '/users/:id' do  #delete 1 user
    
    end 


 end 