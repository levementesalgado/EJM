class CreateClientes < ActiveRecord::Migration[7.2]
  def change
    create_table :clientes do |t|
      t.string :razao_social, null: false
      t.string :cnpj, null: false
      t.string :telefone
      t.string :email
      t.text :endereco
      t.string :contato_responsavel

      t.timestamps
    end
    add_index :clientes, :cnpj, unique: true
  end
end
