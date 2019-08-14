class CreatePengeluarans < ActiveRecord::Migration[5.2]
  def change
    create_table :pengeluarans do |t|
      t.belongs_to :bulan
      t.string :tahun

      t.timestamps
    end
  end
end
