class InputsController < ApplicationController

  def index
    @drivers = Driver.all
  end


  def show
    puts params
  end

  def results
    puts 'MAde it to results'
    puts params
    puts params[:comment]
    puts params[:driver]
    @driver = Driver.find_by(name: params[:driver])
    @comment = Comment.new(comment_text: params[:comment], driver: @driver, team: Team.first)
    puts "comment ID"
    puts @comment
  end

end