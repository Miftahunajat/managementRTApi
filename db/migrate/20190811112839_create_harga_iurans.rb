class CreateHargaIurans < ActiveRecord::Migration[5.2]
  def change
    create_table :harga_iurans do |t|
      t.integer :code
      t.string :nama_iuran
      t.string :harga
      t.timestamps
    end
  end
end
