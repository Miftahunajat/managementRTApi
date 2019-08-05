class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :nama
      t.string :password
      t.string :no_hp
      t.belongs_to :jenis_kelamin
      t.text :alamat

      t.timestamps
    end
  end
end
