# Estrutura de Diretórios — EJM

```
EJM/
├── backend/                    # Rails API Only
│   ├── app/
│   │   ├── controllers/
│   │   ├── models/
│   │   ├── services/
│   │   └── grpc/              # gRPC server
│   ├── config/
│   ├── db/
│   │   ├── migrate/
│   │   └── seeds.rb
│   ├── Gemfile
│   └── Rakefile
│
├── rust-service/               # Rust (ML + Cálculos)
│   ├── src/
│   │   ├── main.rs
│   │   ├── ml/                 # ML prospecção
│   │   ├── calculos/           # Cálculos financeiros
│   │   ├── graficos/           # Geração de dados gráficos
│   │   └── grpc/               # gRPC client
│   ├── Cargo.toml
│   └── proto/                  # Arquivos .proto gRPC
│
├── frontend/                   # Qt C++ Desktop
│   ├── src/
│   │   ├── main.cpp
│   │   ├── widgets/
│   │   ├── views/
│   │   ├── models/
│   │   └── services/
│   ├── resources/
│   ├── CMakeLists.txt
│   └── .pro
│
├── docs/                       # Documentação
│   ├── 01-ER-diagram.md
│   ├── 02-class-diagram.md
│   ├── 03-use-cases.md
│   ├── 04-arquitetura.md
│   ├── 05-sequencia-fluxos.md
│   └── 06-estrutura-diretorios.md
│
├── db/
│   └── backup/                 # Backups criptografados
│
├── .gitignore
├── README.md
└── docker-compose.yml          # PostgreSQL local
```

## Tecnologias por Pasta

| Pasta | Tecnologia | Responsabilidade |
|-------|-----------|-----------------|
| `backend/` | Ruby on Rails API | CRUD, regra de negócio, auth JWT |
| `rust-service/` | Rust | ML, cálculos pesados, gráficos |
| `frontend/` | Qt C++ | Interface desktop, gráficos, UI |
| `docs/` | Markdown + Mermaid | Documentação UML |
| `db/` | PostgreSQL | Banco de dados + backups |
