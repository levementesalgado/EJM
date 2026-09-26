class CreateFinanceiros < ActiveRecord::Migration[7.2]
  def change
    create_table :financeiros do |t|
      t.string :tipo, null: false
      t.decimal :valor, precision: 10, scale: 2, null: false
      t.text :descricao
      t.date :data, null: false
      t.references :projeto, foreign_key: true
      t.string :categoria
      t.string :impostos
      t.string :descontos

      t.timestamps
    end
    add_index :financeiros, :tipo
    add_index :financeiros, :data
  end
end
