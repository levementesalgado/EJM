class CreateColaboradores < ActiveRecord::Migration[7.2]
  def change
    create_table :colaboradores do |t|
      t.string :nome, null: false
      t.string :ra, null: false
      t.string :curso, null: false
      t.string :periodo
      t.text :skills
      t.text :areas_interesse
      t.integer :horas_aacc, default: 0
      t.integer :horas_disponiveis, default: 0
      t.boolean :ativo, default: true

      t.timestamps
    end
    add_index :colaboradores, :ra, unique: true
  end
end
