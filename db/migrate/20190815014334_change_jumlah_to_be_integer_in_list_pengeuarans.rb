class ChangeJumlahToBeIntegerInListPengeuarans < ActiveRecord::Migration[5.2]
  def change
    change_column :list_pengeluarans, :jumlah, :integer
  end
end
