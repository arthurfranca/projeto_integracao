class VehiclesController < ApplicationController
  before_action :set_vehicle, only: [:show, :edit, :update, :destroy]

  # GET /vehicles
  # GET /vehicles.json
  def index #sort_by {|x|[x.rating,x.name,-x.people.size]}
    @vehicles = Vehicle.all.sort_by! { |v| [v.model.manufacturer.name.downcase, v.model.name.downcase] }
  end

  # GET /vehicles/1
  # GET /vehicles/1.json
  def show
  end

  # GET /vehicles/new
  def new
    @vehicle = Vehicle.new
    @vehicle.build_model
    @manufacturers = Manufacturer.all.sort_by(&:name)
    @possible_models = Manufacturer.possible_models @manufacturers.to_a
  end

  # GET /vehicles/1/edit
  def edit
    @manufacturers = Manufacturer.all.sort_by(&:name)
    @possible_models = Manufacturer.possible_models @manufacturers.to_a
  end

  # POST /vehicles
  # POST /vehicles.json
  def create
    @vehicle = Vehicle.new(vehicle_params)

    respond_to do |format|
      if @vehicle.save
        format.html { redirect_to vehicles_path, notice: 'Veículo criado com sucesso.' }
        format.json { render action: 'show', status: :created, location: @vehicle }
      else
        format.html { render action: 'new' }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vehicles/1
  # PATCH/PUT /vehicles/1.json
  def update
    respond_to do |format|
      if @vehicle.update(vehicle_params)
        format.html { redirect_to vehicles_path, notice: 'Veículo editado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicles/1
  # DELETE /vehicles/1.json
  def destroy
    @vehicle.destroy
    respond_to do |format|
      format.html { redirect_to vehicles_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle
      @vehicle = Vehicle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vehicle_params
      params.require(:vehicle).permit :year, :plate, :base_value, :status, :model_id,
        manufacturer_attributes: [:id]
    end
end
