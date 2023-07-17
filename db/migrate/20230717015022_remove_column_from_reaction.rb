class RemoveColumnFromReaction < ActiveRecord::Migration[7.0]
  def change
    remove_column :reactions, :reaction_type, :string
    remove_column :reactions, :comentario_id, :string
  end
end
