class TeamsController < ApplicationController

  # GET: /teamscontrollers
  get "/teamscontrollers" do
    erb :"/teamscontrollers/index.html"
  end

  # GET: /teamscontrollers/new
  get "/teamscontrollers/new" do
    erb :"/teamscontrollers/new.html"
  end

  # POST: /teamscontrollers
  post "/teamscontrollers" do
    redirect "/teamscontrollers"
  end

  # GET: /teamscontrollers/5
  get "/teamscontrollers/:id" do
    erb :"/teamscontrollers/show.html"
  end

  # GET: /teamscontrollers/5/edit
  get "/teamscontrollers/:id/edit" do
    erb :"/teamscontrollers/edit.html"
  end

  # PATCH: /teamscontrollers/5
  patch "/teamscontrollers/:id" do
    redirect "/teamscontrollers/:id"
  end

  # DELETE: /teamscontrollers/5/delete
  delete "/teamscontrollers/:id/delete" do
    redirect "/teamscontrollers"
  end
end
