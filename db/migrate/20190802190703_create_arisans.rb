class CreateArisans < ActiveRecord::Migration[5.2]
  def change
    create_table :arisans do |t|
      t.string :nama
      t.date :mulai
      t.date :selesai
      t.string :iuran
      t.belongs_to :jenis_kelamin

      t.timestamps
    end
  end
end
