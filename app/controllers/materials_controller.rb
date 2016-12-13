class MaterialsController < ApplicationController
  before_action :set_material, only: [:show, :update, :destroy]
  after_action :set_access_control_headers, only: [:create]

       
  # GET /materials
  def index
    @materials = Material.all

    render json: @materials
  end

  # GET /materials/1
  def show
    render json: @material
  end

  # POST /materials
  def create
    @material = Material.new(material_params)

    if @material.save
      render json: @material, status: :created, location: @material
    else
      render json: @material.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /materials/1
  def update
    if @material.update(material_params)
      render json: @material
    else
      render json: @material.errors, status: :unprocessable_entity
    end
  end

  # DELETE /materials/1
  def destroy
    @material.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_material
      @material = Material.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def material_params
      params.require(:material).permit(:title, :code, :cad_data, :preco)
    end
    # headers para habilitar o CORS
    def set_access_control_headers

             response.headers['Access-Control-Allow-Origin'] = '*'          
             headers['Content-Type'] = 'application/json'
             headers['Access-Control-Allow-Origin'] = '*'
             headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
             headers['Access-Control-Request-Method'] = '*'
             headers['Access-Control-Allow-Headers'] = '*'
       end
end
