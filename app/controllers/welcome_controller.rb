class WelcomeController < ApplicationController
  def index
    @company = Company.first.id
    puts @company
    @teams = []

    @subdriver = SubDriver.first.name
    puts @subdriver

  end
end
