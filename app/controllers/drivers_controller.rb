class DriversController < ApplicationController

  # GET: /drivers
  get "/drivers" do
    if logged_in?
      @driver = Driver.all
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
    if logged_in? && params[:name] != nil && params[:driver_class] != nil && params[:number] != nil
      @driver = Driver.create(name: params[:name], driver_class: params[:driver_class], number: params[:number])
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

  # DELETE: /drivers/5/delete
  delete "/drivers/:id/delete" do
    if logged_in?
      @driver = Driver.find(params[:id])
      @team = Team.find_by(id: params[:id])
      if @driver.team == Team.find{|team| team.id == session[:user_id]}
        @driver.delete
        redirect "/teams/#{@team.id}"
      else
        redirect "/drivers"
      end
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
    @team = Team.find{|team| team.id == session[:user_id]}
    @driver = Driver.find_by(id: params[:id])
    if @driver.team.include?(@team)
      if params[:name] != "" && params[:class] != "" && params[:driver_class] != ""
        @driver.update(name: params[:name], class: params[:class])
        redirect "/drivers/#{@driver.id}"
      else
        redirect "/drivers/#{@driver.id}/edit"
      end
    else
      redirect "/drivers"
    end
  end


end
