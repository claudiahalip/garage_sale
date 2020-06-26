class ItemController < ApplicationController

    get '/items' do     
      @items = Item.all
      erb :'items/index'
    end 
    
    get '/items/new'  do 
      erb :'items/new'
    end 

    post '/items' do 
      # if params[:name].blank?
      #   redirect "/items/new"
      # end 
      @item = Item.create(name: params[:item][:name],size: params[:item][:size], brand: params[:item][:brand], color: params[:item][:color], condition: params[:item][:condition], description: params[:item][:descriprion], price: params[:item][:price], user_id: session[:user_id])
        # @item = current_user.items.build(params[:item])
        # @item.save
      redirect "/items/#{@item.id}"
      
       
    end 

    get '/items/:id' do 
        @item = Item.find_by(params[:id])
        erb :'items/show'
    end 

   

    get '/items/:id/edit' do   
      if !logged_in?
        redirect "/login"
      end
      @item = current_user.items.find_by(id: params[:id])
      erb :'items/edit'
    end 

    
    patch '/items/:id' do 
      item = Item.find(params[:id])
      if logged_in? && item.user == current_user
        item.update(params[:item])
        redirect "/items/#{current_user.id}"
      else
        #Flash[:message] = "You're have access to edit this item"
        redirect '/items'
      end 
    end 

    delete '/items/:id' do #delete one item 
      item = Item.find(params[:id])
      if logged_in? && item.user == current_user
        item.destroy
        redirect '/items'
      end 
       #add error , maybe flash [:message]
      
      
    end 
    
    

end 