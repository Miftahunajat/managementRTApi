class User < ApplicationRecord

  after_create :set_user_kk_id_attribute

  belongs_to :kepala_keluarga, class_name: "User", foreign_key: "user_kk_id", optional: true
  belongs_to :jenis_kelamin
  mount_base64_uploader :image_url, ImagesUploader
  has_many :keluarga, class_name: 'User', foreign_key: 'user_kk_id'
  has_and_belongs_to_many :roles
  has_and_belongs_to_many :arisans
  has_many :iurans
  has_many :bayar_arisans, class_name: "UserBayarArisan", foreign_key: ""
  has_many :arisans_user
  # has_many :user_bayar_arisans

  # TODO : Tambah add iuran otomatis
  def self.find_by_nama_password(nama, password)
    User.find_by(nama: nama, password: password)
  end

  private

  def set_user_kk_id_attribute
    update_columns(user_kk_id: id) if user_kk_id.nil?
  end
end
