class ItemController < ApplicationController

    get '/items' do     
      @items = Item.all
      erb :'items/index'
    end 
    
    get '/items/new'  do 
      erb :'items/new'
    end 

    post '/items' do 
      @item = current_user.items.build(params[:item])
      if @item.save 
        redirect "/items/#{@item.id}"
      else 
        erb :'items/new' 
      end 
    end 


    get '/items/:id' do 
      @item = Item.find_by_id(params[:id])
      erb :'items/show'
    end 
  

   

    get '/items/:id/edit' do  
      if !logged_in?
        redirect "/login"
      end
      @item = Item.find_by_id(params[:id])
      erb :'items/edit'
      
    end 

    
    patch '/items/:id' do 
      @item = Item.find(params[:id])
      if logged_in? && @item.user == current_user
        @item.update(params[:item])
        redirect "/items/#{@item.id}"
      else
        flash[:message] = "Not yours to edit!!!"
        redirect '/items'
      end 
    end 

    delete '/items/:id' do 
      item = Item.find(params[:id])
      if logged_in? && item.user == current_user
        item.destroy
        redirect "/users/#{current_user.id}"
      else
        flash[:message] = "Not yours to edit!!!"
        redirect "/items"
      end
    end 
    
    

end 