class Pengunguman < ApplicationRecord

  mount_uploader :image_url, ImagesUploader

  validates_presence_of(
    :title,
    :body,
    :tanggal
  )
end
