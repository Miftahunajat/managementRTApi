class CreateIurans < ActiveRecord::Migration[5.2]
  def change
    create_table :iurans do |t|
      t.belongs_to :user
      t.belongs_to :bulan
      t.string :tahun
      t.boolean :sampah
      t.boolean :sosial

      t.timestamps
    end
  end
end
