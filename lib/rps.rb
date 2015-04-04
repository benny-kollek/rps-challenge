require 'sinatra/base'
require 'cpu'
require 'game'
require 'player'

class RPS < Sinatra::Base
  set :views, proc { File.join(root, "..", "views") }

  GAME = nil

  get '/' do
    erb :index
  end

  get '/new_game' do
    @player = Player.new params[:name]
    GAME = Game.new @player, CPU.new
    session[:player1] = @player.object_id
    erb :new_game
  end

  get '/round_result' do

    erb :round_result
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME
end
