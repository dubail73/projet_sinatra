require 'sinatra'
require 'gossip'

class ApplicationController < Sinatra::Base

  get '/' do
    erb :index, locals: { gossips: Gossip.all }
  end
  get '/gossips/new/' do
    erb :new_gossip
  end

  post '/gossips/new/' do
    gossip = Gossip.new(params["gossip_author"], params["gossip_content"])
    gossip.save
    puts "Ce programme ne fait rien pour le moment, on va donc afficher un message dans le terminal"
    redirect '/'
  end
  

  #Gossip.new("super_auteur", "super gossip").save
end