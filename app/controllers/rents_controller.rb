class RentsController < ApplicationController
  before_action :set_rent, only: [:show, :edit, :update, :destroy]

  # GET /rents
  # GET /rents.json
  def index
    @rents = Rent.all
    @client = Client.new
  end

  # GET /rents/1
  # GET /rents/1.json
  def show
  end

  # GET /rents/new
  def new
    # select's collection
    @vehicles = Vehicle.where(status: "available")

    @rent = Rent.new
    5.times { @rent.uses.build.build_vehicle }

    # New rent btn sends cpf param
    if params[:client]
      cpf = params[:client][:cpf]
    else # Error from #create sends client_id param
      cpf = Client.find(params[:client_id]).cpf
    end
    unless cpf.nil?
      begin
        @rent.client = Client.find_by(cpf: cpf)
      rescue => e
        render :text => "Não existe cliente com o cpf #{cpf.blank? ? 'vazio' : cpf}", :status => 403 
      end
    end
  end

  # GET /rents/1/edit
  def edit
  end

  # POST /rents
  # POST /rents.json
  def create
    @rent = Rent.new(rent_params)
    vehicle_ids = @rent.uses.map(&:vehicle_id)
    # todo: custom validator desconsiderando os marked_to_delete
    if vehicle_ids.length == vehicle_ids.uniq.length # to check length is faster
      respond_to do |format|
        if @rent.save
          format.html { redirect_to @rent, notice: 'Locação salva com sucesso.' }
          format.json { render action: 'show', status: :created, location: @rent }
        else
          byebug
          format.html { render action: 'new' }
          format.json { render json: @rent.errors, status: :unprocessable_entity }
        end
      end
    else
      # now is to make it work with render (same request)
      flash.now[:error] = "O mesmo veículo foi selecionado mais de uma vez."
      # select's collection
      @vehicles = Vehicle.where(status: "available")
      rent_length = @rent.uses.length
      (5 - rent_length).times { @rent.uses.build.build_vehicle }
      render action: "new"
    end
  end

  # PATCH/PUT /rents/1
  # PATCH/PUT /rents/1.json
  def update
    respond_to do |format|
      if @rent.update(rent_params)
        format.html { redirect_to @rent, notice: 'Rent was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @rent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rents/1
  # DELETE /rents/1.json
  def destroy
    @rent.destroy
    respond_to do |format|
      format.html { redirect_to rents_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rent
      @rent = Rent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rent_params
      params.require(:rent).permit :start_date,
        :client_id,
        uses_attributes: [
          :vehicle_id,
          :return_date
        ]
    end
end
