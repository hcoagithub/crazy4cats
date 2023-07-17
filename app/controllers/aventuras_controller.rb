class AventurasController < ApplicationController
  before_action :set_aventura, only: %i[ show edit update destroy ]

  # GET /aventuras or /aventuras.json
  def index
    @aventuras = Aventura.all
    
  end

  # GET /aventuras/1 or /aventuras/1.json
  def show
    @comentario = Comentario.new
    @comentarios = @aventura.comentarios
  end

  # GET /aventuras/new
  def new
    @aventura = Aventura.new
  end

  # GET /aventuras/1/edit
  def edit
  end

  # POST /aventuras or /aventuras.json
  def create
    @aventura = Aventura.new(aventura_params)

    respond_to do |format|
      if @aventura.save
        format.html { redirect_to aventura_url(@aventura), notice: "Aventura was successfully created." }
        format.json { render :show, status: :created, location: @aventura }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @aventura.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aventuras/1 or /aventuras/1.json
  def update
    respond_to do |format|
      if @aventura.update(aventura_params)
        format.html { redirect_to aventura_url(@aventura), notice: "Aventura was successfully updated." }
        format.json { render :show, status: :ok, location: @aventura }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @aventura.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aventuras/1 or /aventuras/1.json
  def destroy
    @aventura.destroy

    respond_to do |format|
      format.html { redirect_to aventuras_url, notice: "Aventura was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aventura
      @aventura = Aventura.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def aventura_params
      params.require(:aventura).permit(:titulo, :descripcion, :fecha, :imagen, :country_id)
    end
end
