class ItemController < ApplicationController

    get '/items' do     #show all items 
      @items = Item.all
      erb :'items/index'
    end 
    
    get '/items/new'  do  #add a new item
      erb :'items/new'
    end 

    post '/items' do  #create 1 itme
      @item = Item.create(params[:item])
      redirect "/items/#{@item.id}"
    end 

    get '/items/:id' do  #show 1 item
        @item = Item.find_by_id(params[:id])
        erb :'items/show'
    end 

   

    get '/items/:id/edit' do    #edit 1 item 
      @item = Item.find_by_id(params[:id])
      erb :'items/edit'
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