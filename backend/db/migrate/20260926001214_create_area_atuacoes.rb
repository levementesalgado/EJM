class CreateAreaAtuacoes < ActiveRecord::Migration[7.2]
  def change
    create_table :area_atuacoes do |t|
      t.string :nome
      t.text :descricao

      t.timestamps
    end
  end
end
