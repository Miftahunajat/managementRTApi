class ArisansUser < ApplicationRecord
    belongs_to :user
    belongs_to :arisan
    has_many :user_bayar_arisans
end
