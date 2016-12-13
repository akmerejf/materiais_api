class CreateMaterials < ActiveRecord::Migration[5.0]
  def change
    create_table :materials do |t|
      t.string :title
      t.string :code
      t.string :cad_data
      t.decimal :preco

      t.timestamps
    end
  end
end
