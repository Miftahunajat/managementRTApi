class Pengeluaran < ApplicationRecord
  validates_presence_of :tahun

  belongs_to :bulan
  has_many :list_pengeluarans, dependent: :destroy


  def total
    list_pengeluarans.sum(:jumlah)
  end
end
