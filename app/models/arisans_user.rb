class ArisansUser < ApplicationRecord
    belongs_to :user
    belongs_to :arisan
    has_many :user_bayar_arisans, dependent: :delete_all

    validates_uniqueness_of :arisan_id, scope: :user_id

    before_create :init

    def init
      self.daftar ||= true
      self.ikut ||= false
      self.tarik ||= false
    end
end
