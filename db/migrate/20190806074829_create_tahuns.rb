class CreateTahuns < ActiveRecord::Migration[5.2]
  def change
    create_table :tahuns do |t|
      t.string :tahun

      t.timestamps
    end
  end
end
