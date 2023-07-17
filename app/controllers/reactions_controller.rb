class ReactionsController < ApplicationController
    before_action :authenticate_user!

    def user_reaction
        @user = current_user
        @aventura = Aventura.find(params[:aventura_id])
        reaction = Reaction.find_by(user_id: @user.id, aventura_id: @aventura.id)
        print reaction
      
    end   
    
    def aventura_with_reactions
        @reactions = current_user.reactions
        aventura_ids = @reactions.map(&:aventura_id)
        @aventuras = Aventura.where(id: aventura_ids)
    end
end

    
   
