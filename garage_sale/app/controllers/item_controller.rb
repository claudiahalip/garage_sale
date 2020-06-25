class ItemController < ApplicationController

    get '/items' do     #show all items 
      @items = Item.all
      erb :'items/index'
    end 
    
    get '/items/new'  do  #add a new item
      erb :'items/new'
    end 

    post '/items' do  #create 1 
    
      #user = User.find_by(id: session[:user_id])
      @item = Item.create(name: params[:item][:name],size: params[:item][:size], brand: params[:item][:brand], color: params[:item][:color], condition: params[:item][:condition], description: params[:item][:descriprion], price: params[:item][:price], user_id: session[:user_id])
      binding.pry
      redirect "/items/#{@item.id}"
    end 

    get '/items/:id' do  #show 1 item
        @item = Item.find_by_id(params[:id])
        erb :'items/show'
    end 

   

    get '/items/:id/edit' do    #edit 1 item 
      if !logged_in?
        redirect "/login"
      else
        if @item = current_user.items.find_by(id: params[:id])
          erb :'item/edit'
        else
          redirect '/items'
        end
      end
      # @item = Item.find_by_id(params[:id])
      # erb :'items/edit'
    end 

    
    patch '/items/:id' do #update 1 item
  
      item = Item.find(params[:id])
      item.update(params[:item])
      redirect "/items/#{item.id}"
    end 

    delete '/items/:id' do #delete one item 
      item = Item.find(params[:id])
      item.destroy
      redirect '/items'
    end 
    
    

end 