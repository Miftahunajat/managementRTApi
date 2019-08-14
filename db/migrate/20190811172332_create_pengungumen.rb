class CreatePengungumen < ActiveRecord::Migration[5.2]
  def change
    create_table :pengungumen do |t|
      t.string :title
      t.text :body
      t.string :image_url
      t.string :image_description
      t.date :tanggal

      t.timestamps
    end
  end
end
