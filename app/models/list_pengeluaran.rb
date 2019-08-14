class ListPengeluaran < ApplicationRecord
  validates_presence_of :keterangan
  validates_presence_of :jumlah
  validates :jumlah, numericality: { only_integer: true }

  before_create :init
  belongs_to :pengeluaran

    def init
      self.jumlah ||= 0
      self.tanggal ||= DateTime.now
    end
end
