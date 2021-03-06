class Admin::CarsController < ApplicationController
  before_filter :authenticate

  before_action :set_car, only: [:show, :edit, :update, :destroy]

  def gallery_car
    @car = Car.find(params[:car_id].to_i) 
    render :layout => false
  end

  # GET /cars
  # GET /cars.json
  def index
    @cars = Car.all
  end

  # GET /cars/1
  # GET /cars/1.json
  def show
  end

  # GET /cars/new
  def new
    @car = Car.new
    5.times { @car.assets.build }
  end

  # GET /cars/1/edit
  def edit
    5.times { @car.assets.build }
  end

  # POST /cars
  # POST /cars.json
  def create
    @car = Car.new(car_params)

    respond_to do |format|
      if @car.save
        format.html { redirect_to [:admin, @car], notice: 'carro criado com sucesso.' }

        format.json { render action: 'show', status: :created, location: [:admin, @car] }
      else
        format.html { render action: 'new' }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cars/1
  # PATCH/PUT /cars/1.json
  def update
    respond_to do |format|
      if @car.update(car_params)
        format.html { redirect_to [:admin, @car], notice: 'carro atualizado com sucesso..' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cars/1
  # DELETE /cars/1.json
  def destroy
    @car.destroy
    respond_to do |format|
      format.html { redirect_to admin_cars_url }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_car
      @car = Car.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def car_params
      params.require(:car).permit(:mark_id, :name, assets_attributes: :asset)
    end

end
