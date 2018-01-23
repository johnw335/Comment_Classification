class InputsController < ApplicationController

  respond_to :html, :json

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
    @general = Driver.find_by(name: 'General')
    @driver = Driver.find_by(name: params[:driver])
    @comment = Comment.new(comment_text: params[:comment], driver: @driver, team: Team.first)
    puts "comment ID"
    puts @comment
  end

  def api_test
    puts "I MADE IT HERE !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"


    respond_to do |format|
      puts 'responding !!!!'
      msg = { :status => "ok", :message => "Success!", :html => "<b>...</b>" }
      format.json  { render :json => msg }
   end
  end

end