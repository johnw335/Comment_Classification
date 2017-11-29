class SubWordJoinsController < ApplicationController
  before_action :set_sub_word_join, only: [:show, :edit, :update, :destroy]

  # GET /sub_word_joins
  # GET /sub_word_joins.json
  def index
    @sub_word_joins = SubWordJoin.all
  end

  # GET /sub_word_joins/1
  # GET /sub_word_joins/1.json
  def show
  end

  # GET /sub_word_joins/new
  def new
    @sub_word_join = SubWordJoin.new
  end

  # GET /sub_word_joins/1/edit
  def edit
  end

  # POST /sub_word_joins
  # POST /sub_word_joins.json
  def create
    @sub_word_join = SubWordJoin.new(sub_word_join_params)

    respond_to do |format|
      if @sub_word_join.save
        format.html { redirect_to @sub_word_join, notice: 'Sub word join was successfully created.' }
        format.json { render :show, status: :created, location: @sub_word_join }
      else
        format.html { render :new }
        format.json { render json: @sub_word_join.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sub_word_joins/1
  # PATCH/PUT /sub_word_joins/1.json
  def update
    respond_to do |format|
      if @sub_word_join.update(sub_word_join_params)
        format.html { redirect_to @sub_word_join, notice: 'Sub word join was successfully updated.' }
        format.json { render :show, status: :ok, location: @sub_word_join }
      else
        format.html { render :edit }
        format.json { render json: @sub_word_join.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sub_word_joins/1
  # DELETE /sub_word_joins/1.json
  def destroy
    @sub_word_join.destroy
    respond_to do |format|
      format.html { redirect_to sub_word_joins_url, notice: 'Sub word join was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sub_word_join
      @sub_word_join = SubWordJoin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sub_word_join_params
      params.fetch(:sub_word_join, {})
    end
end
