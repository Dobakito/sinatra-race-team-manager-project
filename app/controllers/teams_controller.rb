class TeamsController < ApplicationController

  # GET: /login
  get "/login" do
    if !logged_in?
      erb :"/teams/login"
    else
      redirect "/drivers"
    end
  end

  # GET: /signup
  get "/signup" do
    if !logged_in?
      erb :"/teams/signup"
    else
      redirect "/drivers"
    end
  end

  # GET: /teams/5
  get "/teams/:id" do
    erb :"/teams/show"
  end

  # POST: /signup
  post "/signup" do
    erb :"/teams/edit.html"
  end

  # POST: /login
  post "/login" do
    redirect "/drivers"
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
