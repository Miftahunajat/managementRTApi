class Iuran < ApplicationRecord
  belongs_to :user
  belongs_to :bulan

  validates_uniqueness_of :bulan_id, scope: %i[tahun user_id]

  after_initialize :set_defaults

  private

  def set_defaults
    if new_record?
      self.sampah ||= false
      self.sosial ||= false
    end
  end
end
