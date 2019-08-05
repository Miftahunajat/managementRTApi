class Iuran < ApplicationRecord
  belongs_to :user
  belongs_to :bulan

  after_initialize :set_defaults

  private

  def set_defaults
    if new_record?
      self.sampah ||= false
      self.sosial ||= false
    end
  end
end
