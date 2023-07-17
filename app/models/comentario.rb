class Comentario < ApplicationRecord
  belongs_to :aventura
  belongs_to :user
  

end
