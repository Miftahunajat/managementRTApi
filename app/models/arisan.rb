class Arisan < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :arisans_users, dependent: :delete_all
  belongs_to :jenis_kelamin

  attr_accessor :user_id
  @user_id

  validates :iuran, presence: true

  def user_ikut
    arisans_users.where(user_id: user_id).first.try(:ikut)
  end

  def peserta
    arisans_users.count
  end

  def peserta_verifikasi
    users.where('arisans_users.daftar = true and arisans_users.ikut = false').all
  end

  def peserta_sudah_ditarik
    users.where('arisans_users.tarik = true').all
  end

  def peserta_belum_membayar
    users
      .where('arisans_users.daftar = true and arisans_users.ikut = true')
      .joins("INNER JOIN user_bayar_arisans ON user_bayar_arisans.arisans_user_id = arisans_users.id")
      .where(user_bayar_arisans: { bulan_id: Time.now.month, tahun: Time.now.year, bayar: false})
  end

  def peserta_sudah_membayar
    users
      .where('arisans_users.daftar = true and arisans_users.ikut = true')
      .joins("INNER JOIN user_bayar_arisans ON user_bayar_arisans.arisans_user_id = arisans_users.id")
      .where(user_bayar_arisans: { bulan_id: Time.now.month, tahun: Time.now.year, bayar: true})
  end
end
