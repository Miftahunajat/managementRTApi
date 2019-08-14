class HargaIuran < ApplicationRecord
  validates_uniqueness_of :code
end
