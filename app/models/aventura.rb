class Aventura < ApplicationRecord
  Kinds = %w[like dislike not_interested neutral].freeze
  KindsSpanish = {"like" => "Me gusta", "dislike" => "No me gusta"}.freeze

  def count_with_kind(arg)
    number = self.reactions.where(kind: arg).count
    return "#{arg} - #{number}"
  end

  def find_kind_user_relation(user)
    self.reactions.find_by(user_id: user.id).kind
  end


  belongs_to :country
  has_many :comentarios
  has_many :reactions, dependent: :destroy
  has_many :users, through: :reactions
end
