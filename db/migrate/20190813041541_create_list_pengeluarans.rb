class CreateListPengeluarans < ActiveRecord::Migration[5.2]
  def change
    create_table :list_pengeluarans do |t|
      t.belongs_to :pengeluaran
      t.string :jumlah
      t.string :keterangan
      t.date :tanggal

      t.timestamps
    end
  end
end
