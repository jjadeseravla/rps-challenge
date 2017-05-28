require 'sinatra/base'
require 'sinatra'
require 'capybara'
require 'capybara/rspec'
require 'rspec'
require './lib/Game'
require './lib/Player'

class RPS < Sinatra::Base

  enable :sessions

  get '/' do
    erb(:index)
  end

  get '/play' do
    @player = session[:player]
    @object = session[:object]
    @computer_object = session[:computer_object]
    erb(:play)
  end

  post '/name' do
    session[:player] = params[:player]
    redirect '/play'
  end

  post '/play' do
    session[:object] = params[:object]
    session[:computer_object] = Game.new.random_selection
    redirect '/play'
  end

  # post '/commence' do
  #
  # end

   run! if app_file == $0
end
