class Bulan < ApplicationRecord

  def self.by_name(nama_bulan)
    find_by(nama_bulan: nama_bulan)
  end
end
