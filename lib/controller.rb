require 'bundler'
Bundler.require

require 'gossip'

class ApplicationController < Sinatra::Base
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end
  
  get '/gossips/new' do
    erb :new_gossip
  end

  post '/gossips/new/' do
    ##Gossip.new(author, content).save
    ##Gossip.new("super_auteur", "super gossip").save
    ##Gossip.new.save
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect '/'
  end

  get '/gossips/:id/' do
    id = params["id"].to_i
    erb :show, locals: {gossip: Gossip.find(id), id: id}
  end 
end