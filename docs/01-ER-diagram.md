# Diagrama Entidade-Relacionamento — EJM

```mermaid
erDiagram
    DIRETORIA {
        serial id PK
        string nome
        string ra UK
        string curso
        string cargo
        int idade
        string disponibilidade
        date mandato_inicio
        date mandato_fim
        string senha_hash
    }

    COLABORADOR {
        serial id PK
        string nome
        string ra UK
        string curso
        string periodo
        text skills
        text areas_interesse
        int horas_aacc
        int horas_disponiveis
        boolean ativo
    }

    PRESTADOR_SERVICO {
        serial id PK
        int colaborador_id FK
        int projeto_id FK
        int horas_alocadas
        date data_inicio
        date data_fim
    }

    CLIENTE {
        serial id PK
        string razao_social
        string cnpj UK
        string telefone
        string email
        text endereco
        string contato_responsavel
    }

    AREA_ATUACAO {
        serial id PK
        string nome
        text descricao
    }

    PROJETO {
        serial id PK
        string titulo
        text descricao
        int cliente_id FK
        decimal valor
        date prazo
        string status
        date data_criacao
        text observacoes
    }

    PROJETO_AREA {
        int projeto_id FK
        int area_id FK
    }

    CONTRATO {
        serial id PK
        int projeto_id FK
        decimal valor
        date periodo_inicio
        date periodo_fim
        text clausulas
        string status
        string anexo_path
    }

    FINANCEIRO {
        serial id PK
        string tipo
        decimal valor
        text descricao
        date data
        int projeto_id FK
        string categoria
        string impostos
        string descontos
    }

    PROSPECACAO {
        serial id PK
        int cliente_id FK
        text tags
        text noticias
        string periodo_contrato
        string status
        date data_captacao
        text observacoes_ml
    }

    DIRETORIA ||--o{ PROJETO : "aprova"
    CLIENTE ||--o{ PROJETO : "solicita"
    CLIENTE ||--o{ CONTRATO : "possui"
    CLIENTE ||--o{ PROSPECACAO : "rastreado"
    PROJETO ||--|| CONTRATO : "possui"
    PROJETO ||--o{ PRESTADOR_SERVICO : "aloca"
    COLABORADOR ||--o{ PRESTADOR_SERVICO : "executa"
    PROJETO }o--o{ AREA_ATUACAO : "envolve"
    PROJETO ||--o{ FINANCEIRO : "gera"
    AREA_ATUACAO }o--o{ COLABORADOR : "interesse"
```

## Entidades Principais
| Entidade | Descrição |
|----------|-----------|
| DIRETORIA | 23 sócios, 1 cargo cada, mandato variável |
| COLABORADOR | Alunos interessados, cadastrados pela diretoria |
| PRESTADOR_SERVICO | Colaboradores alocados em projetos |
| CLIENTE | Empresas da região de Capão Bonito |
| PROJETO | Consultorias multidisciplinares |
| CONTRATO | Sempre vinculado a um projeto |
| FINANCEIRO | Entradas, saídas, despesas, infraestrutura |
| AREA_ATUACAO | Silvicultura, Sistemas Inteligentes, Agroindústria, Mecanização |
| PROSPECACAO | ML com documentos, tracker de empresas, notícias |
