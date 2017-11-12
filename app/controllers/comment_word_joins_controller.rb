class CommentWordJoinsController < ApplicationController
  before_action :set_comment_word_join, only: [:show, :edit, :update, :destroy]

  # GET /comment_word_joins
  # GET /comment_word_joins.json
  def index
    @comment_word_joins = CommentWordJoin.all
  end

  # GET /comment_word_joins/1
  # GET /comment_word_joins/1.json
  def show
  end

  # GET /comment_word_joins/new
  def new
    @comment_word_join = CommentWordJoin.new
  end

  # GET /comment_word_joins/1/edit
  def edit
  end

  # POST /comment_word_joins
  # POST /comment_word_joins.json
  def create
    @comment_word_join = CommentWordJoin.new(comment_word_join_params)

    respond_to do |format|
      if @comment_word_join.save
        format.html { redirect_to @comment_word_join, notice: 'Comment word join was successfully created.' }
        format.json { render :show, status: :created, location: @comment_word_join }
      else
        format.html { render :new }
        format.json { render json: @comment_word_join.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comment_word_joins/1
  # PATCH/PUT /comment_word_joins/1.json
  def update
    respond_to do |format|
      if @comment_word_join.update(comment_word_join_params)
        format.html { redirect_to @comment_word_join, notice: 'Comment word join was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment_word_join }
      else
        format.html { render :edit }
        format.json { render json: @comment_word_join.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comment_word_joins/1
  # DELETE /comment_word_joins/1.json
  def destroy
    @comment_word_join.destroy
    respond_to do |format|
      format.html { redirect_to comment_word_joins_url, notice: 'Comment word join was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment_word_join
      @comment_word_join = CommentWordJoin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_word_join_params
      params.fetch(:comment_word_join, {})
    end
end
