class Country < ApplicationRecord
    has_many :aventuras, dependent: :destroy

end
