class CommentSubJoinsController < ApplicationController
  before_action :set_comment_sub_join, only: [:show, :edit, :update, :destroy]

  # GET /comment_sub_joins
  # GET /comment_sub_joins.json
  def index
    @comment_sub_joins = CommentSubJoin.all
  end

  # GET /comment_sub_joins/1
  # GET /comment_sub_joins/1.json
  def show
  end

  # GET /comment_sub_joins/new
  def new
    @comment_sub_join = CommentSubJoin.new
  end

  # GET /comment_sub_joins/1/edit
  def edit
  end

  # POST /comment_sub_joins
  # POST /comment_sub_joins.json
  def create

    @comment_sub_join = CommentSubJoin.new(comment_sub_join_params)
    @comment_id = params[:comment]
    @comment = Comment.find(@comment_id)

    @sub_list = params.select{|key, hash| hash == "1" }
    puts @sub_list
    @sub_list_cleaned = @sub_list.delete_if {|key, value| key >= "comment" }
    # puts @sub_list_cleaned

    @sub_list_cleaned.each {|key, value|
      @sub = SubDriver.find_by(name: "#{key}")
      puts @sub.name
      #create the new join here
    }




    # respond_to do |format|
    #   if @comment_sub_join.save
    #     format.html { redirect_to @comment_sub_join, notice: 'Comment sub join was successfully created.' }
    #     format.json { render :show, status: :created, location: @comment_sub_join }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @comment_sub_join.errors, status: :unprocessable_entity }
    #   end
    # end

  end


  # PATCH/PUT /comment_sub_joins/1
  # PATCH/PUT /comment_sub_joins/1.json
  def update
    respond_to do |format|
      if @comment_sub_join.update(comment_sub_join_params)
        format.html { redirect_to @comment_sub_join, notice: 'Comment sub join was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment_sub_join }
      else
        format.html { render :edit }
        format.json { render json: @comment_sub_join.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comment_sub_joins/1
  # DELETE /comment_sub_joins/1.json
  def destroy
    @comment_sub_join.destroy
    respond_to do |format|
      format.html { redirect_to comment_sub_joins_url, notice: 'Comment sub join was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment_sub_join
      @comment_sub_join = CommentSubJoin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_sub_join_params
      params.fetch(:comment_sub_join, {})
    end
end
