require 'gossip'
require 'csv'

class ApplicationController < Sinatra::Base
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end
  
  get '/gossips/new/' do
    erb :new_gossip
  end

  post '/gossips/new/' do
    ##Gossip.new(author, content).save
    ##Gossip.new("super_auteur", "super gossip").save
    ##Gossip.new.save
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect '/'
  end

  get '/gossips/:id' do
    puts "Potin numéro #{params['id']} choisi : "
    erb :show, locals: {gossips: Gossip.find(params['id'].to_i)}
    
  end

end 