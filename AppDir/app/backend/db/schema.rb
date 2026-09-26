# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2026_09_26_001250) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "area_atuacoes", force: :cascade do |t|
    t.string "nome"
    t.text "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clientes", force: :cascade do |t|
    t.string "razao_social", null: false
    t.string "cnpj", null: false
    t.string "telefone"
    t.string "email"
    t.text "endereco"
    t.string "contato_responsavel"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cnpj"], name: "index_clientes_on_cnpj", unique: true
  end

  create_table "colaboradores", force: :cascade do |t|
    t.string "nome", null: false
    t.string "ra", null: false
    t.string "curso", null: false
    t.string "periodo"
    t.text "skills"
    t.text "areas_interesse"
    t.integer "horas_aacc", default: 0
    t.integer "horas_disponiveis", default: 0
    t.boolean "ativo", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ra"], name: "index_colaboradores_on_ra", unique: true
  end

  create_table "contratos", force: :cascade do |t|
    t.bigint "projeto_id", null: false
    t.decimal "valor", precision: 10, scale: 2
    t.date "periodo_inicio"
    t.date "periodo_fim"
    t.text "clausulas"
    t.string "status", default: "rascunho"
    t.string "anexo_path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["projeto_id"], name: "index_contratos_on_projeto_id"
  end

  create_table "diretorias", force: :cascade do |t|
    t.string "nome", null: false
    t.string "ra", null: false
    t.string "curso", null: false
    t.string "cargo", null: false
    t.integer "idade"
    t.string "disponibilidade"
    t.date "mandato_inicio"
    t.date "mandato_fim"
    t.string "senha_hash", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ra"], name: "index_diretorias_on_ra", unique: true
  end

  create_table "financeiros", force: :cascade do |t|
    t.string "tipo", null: false
    t.decimal "valor", precision: 10, scale: 2, null: false
    t.text "descricao"
    t.date "data", null: false
    t.bigint "projeto_id"
    t.string "categoria"
    t.string "impostos"
    t.string "descontos"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["data"], name: "index_financeiros_on_data"
    t.index ["projeto_id"], name: "index_financeiros_on_projeto_id"
    t.index ["tipo"], name: "index_financeiros_on_tipo"
  end

  create_table "prestador_servicos", force: :cascade do |t|
    t.bigint "colaborador_id", null: false
    t.bigint "projeto_id", null: false
    t.integer "horas_alocadas"
    t.date "data_inicio"
    t.date "data_fim"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["colaborador_id"], name: "index_prestador_servicos_on_colaborador_id"
    t.index ["projeto_id"], name: "index_prestador_servicos_on_projeto_id"
  end

  create_table "projeto_areas", force: :cascade do |t|
    t.bigint "projeto_id", null: false
    t.bigint "area_atuacao_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_atuacao_id"], name: "index_projeto_areas_on_area_atuacao_id"
    t.index ["projeto_id"], name: "index_projeto_areas_on_projeto_id"
  end

  create_table "projetos", force: :cascade do |t|
    t.string "titulo", null: false
    t.text "descricao"
    t.bigint "cliente_id", null: false
    t.decimal "valor", precision: 10, scale: 2
    t.date "prazo"
    t.string "status", default: "pendente"
    t.date "data_criacao"
    t.text "observacoes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cliente_id"], name: "index_projetos_on_cliente_id"
    t.index ["status"], name: "index_projetos_on_status"
  end

  create_table "prospeccoes", force: :cascade do |t|
    t.bigint "cliente_id", null: false
    t.text "tags"
    t.text "noticias"
    t.string "periodo_contrato"
    t.string "status"
    t.date "data_captacao"
    t.text "observacoes_ml"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cliente_id"], name: "index_prospeccoes_on_cliente_id"
  end

  add_foreign_key "contratos", "projetos"
  add_foreign_key "financeiros", "projetos"
  add_foreign_key "prestador_servicos", "colaboradores"
  add_foreign_key "prestador_servicos", "projetos"
  add_foreign_key "projeto_areas", "area_atuacoes"
  add_foreign_key "projeto_areas", "projetos"
  add_foreign_key "projetos", "clientes"
  add_foreign_key "prospeccoes", "clientes"
end
