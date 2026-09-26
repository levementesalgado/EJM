class CreateProjetos < ActiveRecord::Migration[7.2]
  def change
    create_table :projetos do |t|
      t.string :titulo, null: false
      t.text :descricao
      t.references :cliente, null: false, foreign_key: true
      t.decimal :valor, precision: 10, scale: 2
      t.date :prazo
      t.string :status, default: 'pendente'
      t.date :data_criacao
      t.text :observacoes

      t.timestamps
    end
    add_index :projetos, :status
  end
end
