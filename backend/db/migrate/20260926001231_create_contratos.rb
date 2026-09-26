class CreateContratos < ActiveRecord::Migration[7.2]
  def change
    create_table :contratos do |t|
      t.references :projeto, null: false, foreign_key: true
      t.decimal :valor, precision: 10, scale: 2
      t.date :periodo_inicio
      t.date :periodo_fim
      t.text :clausulas
      t.string :status, default: 'rascunho'
      t.string :anexo_path

      t.timestamps
    end
  end
end
