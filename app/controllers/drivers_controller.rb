class DriversController < ApplicationController

  # GET: /drivers
  get "/drivers" do
    erb :"/drivers/index"
  end

  # GET: /drivers/new
  get "/drivers/new" do
    erb :"/drivers/new"
  end

  # POST: /drivers
  post "/drivers" do
    redirect "/drivers"
  end

  # GET: /drivers/5
  get "/drivers/:id" do
    erb :"/drivers/show"
  end

  # GET: /drivers/5/edit
  get "/drivers/:id/edit" do
    erb :"/drivers/edit"
  end

  # PATCH: /drivers/5
  patch "/drivers/:id" do
    redirect "/drivers/:id"
  end

  # DELETE: /drivers/5/delete
  delete "/drivers/:id/delete" do
    redirect "/drivers"
  end
end
