class SubDriversController < ApplicationController
  before_action :set_sub_driver, only: [:show, :edit, :update, :destroy]

  # GET /sub_drivers
  # GET /sub_drivers.json
  def index
    @sub_drivers = SubDriver.all
  end

  # GET /sub_drivers/1
  # GET /sub_drivers/1.json
  def show
  end

  # GET /sub_drivers/new
  def new
    @sub_driver = SubDriver.new
  end

  # GET /sub_drivers/1/edit
  def edit
  end

  # POST /sub_drivers
  # POST /sub_drivers.json
  def create
    @sub_driver = SubDriver.new(sub_driver_params)

    respond_to do |format|
      if @sub_driver.save
        format.html { redirect_to @sub_driver, notice: 'Sub driver was successfully created.' }
        format.json { render :show, status: :created, location: @sub_driver }
      else
        format.html { render :new }
        format.json { render json: @sub_driver.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sub_drivers/1
  # PATCH/PUT /sub_drivers/1.json
  def update
    respond_to do |format|
      if @sub_driver.update(sub_driver_params)
        format.html { redirect_to @sub_driver, notice: 'Sub driver was successfully updated.' }
        format.json { render :show, status: :ok, location: @sub_driver }
      else
        format.html { render :edit }
        format.json { render json: @sub_driver.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sub_drivers/1
  # DELETE /sub_drivers/1.json
  def destroy
    @sub_driver.destroy
    respond_to do |format|
      format.html { redirect_to sub_drivers_url, notice: 'Sub driver was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sub_driver
      @sub_driver = SubDriver.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sub_driver_params
      params.fetch(:sub_driver, {})
    end
end
