class ChangeJumlahToBeIntegerInListPengeuarans < ActiveRecord::Migration[5.2]
  def change
    # change_column :list_pengeluarans, :jumlah, :integer
    change_column :list_pengeluarans, :jumlah, 'integer USING CAST(jumlah AS integer)'
  end
end
