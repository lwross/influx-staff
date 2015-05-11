class EmployeesController < ApplicationController
  require "rubygems"
  require "twitter"

  def new
  end

  def show

    require "twitter"

    @employee = Employee.find(params[:id])

    # Certain methods require authentication. To get your Twitter OAuth credentials,
    # register an app at http://dev.twitter.com/apps
    client = Twitter::REST::Client.new do |config|
      config.consumer_key = 'HebdbxuAYae9CznCDcgBA'
      config.consumer_secret =  'jtWeihc1OgR7wWjeAs7N5iXbl30KnKVDYeeCJeXNps'
      config.oauth_token = '8138422-jkJorqY9NBEVI0Twi0phy778wQLH7JW0mY9qNFGQot'
      config.oauth_token_secret = 'AwVs8uypvE9fi9kkxLhubDf3kOVN6sCKQdpFCgcsVyJ63'
    end

    if @employee.twitter.length > 0
      @twitter_user = client.user(@employee.twitter)
      @tweets = client.user_timeline(@employee.twitter)
    end

  end

  def create
    @employee = Employee.new(employee_params)

    @employee.save
    redirect_to @employee
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    redirect_to action: "index"
  end

  private
  def employee_params
    params.require(:employee).permit(:name, :position, :bio, :twitter, :linkedIn)
  end

end
