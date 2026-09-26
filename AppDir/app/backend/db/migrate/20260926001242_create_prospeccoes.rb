class CreateProspeccoes < ActiveRecord::Migration[7.2]
  def change
    create_table :prospeccoes do |t|
      t.references :cliente, null: false, foreign_key: true
      t.text :tags
      t.text :noticias
      t.string :periodo_contrato
      t.string :status
      t.date :data_captacao
      t.text :observacoes_ml

      t.timestamps
    end
  end
end
