class DashboardController < ApplicationController

  def index
    @drivers = Driver.all
    @subs = SubDriver.all

  end

end
