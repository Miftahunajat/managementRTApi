class CreateBulans < ActiveRecord::Migration[5.2]
  def change
    create_table :bulans do |t|
      t.string :nama_bulan

      t.timestamps
    end
  end
end
