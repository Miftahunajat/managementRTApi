class CreateUserBayarArisans < ActiveRecord::Migration[5.2]
  def change
    create_table :user_bayar_arisans do |t|
      t.belongs_to :arisans_user
      t.belongs_to :bulan
      t.string :tahun
      t.boolean :bayar

      t.timestamps
    end
  end
end
