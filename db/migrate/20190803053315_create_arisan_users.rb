class CreateArisanUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :arisans_users do |t|
      t.belongs_to :user
      t.belongs_to :arisan
      t.boolean :daftar
      t.boolean :ikut
      t.boolean :tarik

      t.timestamps
    end
  end
end
