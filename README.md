# EJM — Sistema de Gestão para Empresa Júnior

Sistema desktop para gestão de Empresa Júnior da Fatec de Capão Bonito - SP.

## Stack

| Componente | Tecnologia |
|-----------|-----------|
| Backend | Ruby on Rails API Only |
| Tarefas Pesadas | Rust (ML, cálculos, gráficos) |
| Frontend | Qt C++ (desktop) |
| Banco | PostgreSQL local |
| Comunicação | gRPC |
| Auth | JWT + hash senhas |
| Versionamento | GitHub privado |

## Funcionalidades

- Gestão de projetos multidisciplinares
- Controle de diretoria (23 sócios)
- Cadastro de colaboradores e prestadores de serviço
- Gestão de clientes e contratos
- Controle financeiro completo
- Prospecção de clientes com ML
- Relatórios e gráficos

## Estrutura

```
EJM/
├── backend/        # Rails API
├── rust-service/   # Rust (ML + Cálculos)
├── frontend/       # Qt C++ Desktop
├── docs/           # Documentação UML
└── db/             # PostgreSQL + backups
```

## Setup

```bash
# Backend
cd backend && bundle install && rails db:create

# Rust
cd rust-service && cargo build

# Frontend
cd frontend && mkdir build && cd build && cmake .. && make
```

## Documentação

Ver `docs/` para diagramas UML (ER, classes, casos de uso, sequência, arquitetura).
