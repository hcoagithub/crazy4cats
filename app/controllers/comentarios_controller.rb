class ComentariosController < ApplicationController
    
    def create
        @aventura = Aventura.find(params[:comentario][:aventura_id])
        @comentario = Comentario.new(comentario_params)
        @comentario.user = current_user
        respond_to do |format|
            if @comentario.save
                format.html { redirect_to aventura_path(@aventura.id), notice:
                'comentario was successfully created.' }
            else
                format.html { redirect_to aventura_path(@aventura.id), notice:
                'comentario was not created.' }
            end
        end
    end

    private

    def comentario_params
        params.require(:comentario).permit(:contenido, :aventura_id)
    end
        
end
