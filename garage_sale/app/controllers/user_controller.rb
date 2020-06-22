require './config/environment'

class UserController < ApplicationController


    get '/users' do 
      @users = User.all
      erb :'users/index'
    end 
    
    get '/users/new' do  #add a new user
      erb :'users/new'
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