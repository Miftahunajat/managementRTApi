class Arisan < ApplicationRecord
    has_and_belongs_to_many :users
    has_many :arisans_users
end
