class DriversController < ApplicationController

  # GET: /drivers
  get "/drivers" do
    if logged_in?
      @team = Team.find{|team| team.id == session[:user_id]}
      @drivers = Driver.find {|driver| driver.id == @team.id}
      erb :"/drivers/drivers"
    else
      redirect "/login"
    end
  end

  # GET: /drivers/new
  get "/drivers/new" do
    if logged_in?
      erb :"/drivers/new"
    else
      redirect "/login"
    end
  end

  # POST: /drivers
  post "/drivers" do
    if logged_in? && params[:name] != "" && params[:class] != ""
      @driver = Driver.create(name: params[:name], class: params[:class])
      @team = current_user
      @team.drivers << @driver
      redirect "/drivers/#{@driver.id}"
    else
      redirect "/drivers/new"
    end
  end

  # GET: /drivers/5
  get "/drivers/:id" do
    if logged_in?
      @driver = Driver.find_by(id: params[:id])
      erb :"/drivers/show"
    else
      redirect "/login"
    end
  end

  # GET: /drivers/5/edit
  get "/drivers/:id/edit" do
    if logged_in?
      @driver = Driver.find_by(id: params[:id])
      if @driver && @driver.team == current_user
        erb :"/drivers/edit"
      else
        redirect "/drivers/#{@driver.id}"
      end
    else
      redirect "/login"
    end
  end

  # PATCH: /drivers/5
  patch "/drivers/:id" do
    @driver = Driver.find_by(id: params[:id])
    @driver.update(name: params[:name], class: params[:class])
    redirect "/drivers/:id"
  end

  # DELETE: /drivers/5/delete
  delete "/drivers/:id/delete" do
    redirect "/drivers"
  end
end
