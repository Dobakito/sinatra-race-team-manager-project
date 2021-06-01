class TeamsController < ApplicationController

  # GET: /login
  get "/login" do
    if !logged_in?
      erb :"/teams/login"
    else
      redirect "/drivers"
    end
  end

  get "/teams" do
    if logged_in?
      @teams = Team.all
      erb :"/teams/teams"
    else
      redirect "/login"
    end
  end

  # GET: /signup
  get "/signup" do
    if !logged_in?
      erb :"/teams/signup"
    else
      redirect "/teams"
    end
  end

  # GET: /teams/5
  get "/teams/:id" do
    if logged_in?
      @team = Team.find_by(id: params[:id])
      erb :"/teams/show"
    else
      redirect "/login"
    end
  end

  # POST: /signup
  post "/signup" do
    if params[:name] == nil || params[:email] == nil || params[:password] == nil
      redirect "/signup"
    elsif Team.find_by(name: params[:name])
        redirect "/signup"
    else
        @team = Team.create(:name => params[:name], :email => params[:email], :password => params[:password])
        login(@team.id)
        redirect "/teams"
    end
  end

  # POST: /login
  post "/login" do
    @team = Team.find_by(:name => params[:name])
     if @team && @team.authenticate(params[:password])
       login(@team.id)
       redirect "/teams"
     else
       redirect "/login"
     end
  end

  # GET: /logout
  get "/logout" do
    if logged_in?
      session.clear
      redirect "/login"
    else
      redirect "/"
    end
  end
end
