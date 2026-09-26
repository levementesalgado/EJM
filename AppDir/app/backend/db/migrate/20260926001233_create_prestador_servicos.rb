class CreatePrestadorServicos < ActiveRecord::Migration[7.2]
  def change
    create_table :prestador_servicos do |t|
      t.references :colaborador, null: false, foreign_key: true
      t.references :projeto, null: false, foreign_key: true
      t.integer :horas_alocadas
      t.date :data_inicio
      t.date :data_fim

      t.timestamps
    end
  end
end
