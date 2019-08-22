class ArisansUser < ApplicationRecord
    belongs_to :user
    belongs_to :arisan
    has_many :user_bayar_arisans, dependent: :delete_all
    before_create :assign_nama

    before_create :init

    def init
      self.daftar ||= true
      self.ikut ||= false
      self.tarik ||= false
    end

    def assign_nama
      number = ArisansUser.where(arisan_id: arisan_id, user_id: user_id).count
      self.nama_peserta = "#{user.nama} #{number+1}"
    end

    def sudah_membayar
      user_bayar_arisans.find_by(bulan_id: Time.now.month, tahun: Time.now.year).try(:bayar) == true
    end
end
