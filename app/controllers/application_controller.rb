require './config/environment'
class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "my_secret"
    # use Rack::Session::Cookie, :key => 'rack.session',
    #                        :path => '/',
    #                        :secret => 'your_secret'
  end

  get "/" do
    erb :front_page
  end

  helpers do

    def logged_in?
      !!session[:user_id]
    end

    def current_user
      if logged_in?
        @current_user = Team.find_by(id: session[:user_id])
      end
    end

    def login(id)
      session[:session_id]
      session[:user_id] = id
    end
  end
end
