class ItemController < ApplicationController

    get '/items' do     #show all items 
      @items = Item.all
      erb :'items/index'
    end 
    
    get '/items/new'  do  #add a new item
      erb :'items/new'
    end 

    get '/items/:id' do  #show 1 item
        # @item = Item.find_by_id(params[:id])
        erb :'items/show'
    end 

    get '/itmes/:id/edit' do #edit 1 item 
      # @item = Item.find_by_id(params[:id])
      erb :'items/edit'
    end 

    post '/items' do  #create 1 itme
      # item = Item.create(params)
      # redirect '/itmes'
    end 
    
    patch '/items/:id' do #update 1 item
      # item = Item.find(params[:id])
      # item.update(name: params[:name] )
      # redirect '/items/:id'
    end 

    delete '/items/:id' do #delete one item 
      # item = Item.find_by(params[:id])
      # item.destroy
      # redirect '/items'
    end 

    

end 