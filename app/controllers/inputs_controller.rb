class InputsController < ApplicationController

  respond_to :html, :json
  # before_action :cors_set_access_control_headers


  # def cors_set_access_control_headers
  #     headers['Access-Control-Allow-Origin'] = '*'
  # end

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

    respond_to do |format|
      format.js do
        puts 'responding !!!!'
        msg = { :status => '200', :message => "Success!!!!!!!!"}
        # format.json  { render json: msg, status: 'ok' }
        render :json => msg
      end
    end
  end

end