class AddNamaPesertaToArisansUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :arisans_users, :nama_peserta, :string, null: false
  end
end
