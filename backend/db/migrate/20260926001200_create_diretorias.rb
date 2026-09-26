class CreateDiretorias < ActiveRecord::Migration[7.2]
  def change
    create_table :diretorias do |t|
      t.string :nome, null: false
      t.string :ra, null: false
      t.string :curso, null: false
      t.string :cargo, null: false
      t.integer :idade
      t.string :disponibilidade
      t.date :mandato_inicio
      t.date :mandato_fim
      t.string :senha_hash, null: false

      t.timestamps
    end
    add_index :diretorias, :ra, unique: true
  end
end
