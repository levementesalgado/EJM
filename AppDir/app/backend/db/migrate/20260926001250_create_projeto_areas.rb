class CreateProjetoAreas < ActiveRecord::Migration[7.2]
  def change
    create_table :projeto_areas do |t|
      t.references :projeto, null: false, foreign_key: true
      t.references :area_atuacao, null: false, foreign_key: true

      t.timestamps
    end
  end
end
