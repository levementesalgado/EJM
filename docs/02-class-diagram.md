# Diagrama de Classes — EJM

```mermaid
classDiagram
    direction TB

    class Diretoria {
        +int id
        +string nome
        +string ra
        +string curso
        +string cargo
        +int idade
        +string disponibilidade
        +date mandato_inicio
        +date mandato_fim
        +aprovar_projeto(projeto)
        +cadastrar_colaborador(colaborador)
    }

    class Colaborador {
        +int id
        +string nome
        +string ra
        +string curso
        +string periodo
        +text skills
        +text areas_interesse
        +int horas_aacc
        +int horas_disponiveis
        +boolean ativo
        +verificar_disponibilidade()
        +calcular_horas_disponiveis()
    }

    class PrestadorServico {
        +int id
        +int horas_alocadas
        +date data_inicio
        +date data_fim
        +registra_horas()
    }

    class Cliente {
        +int id
        +string razao_social
        +string cnpj
        +string telefone
        +string email
        +text endereco
        +string contato_responsavel
        +solicitar_projeto()
    }

    class Projeto {
        +int id
        +string titulo
        +text descricao
        +decimal valor
        +date prazo
        +string status
        +date data_criacao
        +text observacoes
        +aprovar()
        +reprovar()
        +alocar_prestador()
        +get_areas()
    }

    class Contrato {
        +int id
        +decimal valor
        +date periodo_inicio
        +date periodo_fim
        +text clausulas
        +string status
        +string anexo_path
        +gerar_contrato()
        +validar()
    }

    class Financeiro {
        +int id
        +string tipo
        +decimal valor
        +text descricao
        +date data
        +string categoria
        +string impostos
        +string descontos
        +registrar_entrada()
        +registrar_saida()
        +gerar_relatorio()
    }

    class AreaAtuacao {
        +int id
        +string nome
        +text descricao
    }

    class Prospeccao {
        +int id
        +text tags
        +text noticias
        +string periodo_contrato
        +string status
        +date data_captacao
        +text observacoes_ml
        +analisar_documento()
        +gerar_tags()
        +rastrear_empresa()
    }

    class AuthService {
        +login(ra, senha)
        +logout(token)
        +validar_token(token)
        +criar_conta(dados)
        +hash_senha(senha)
    }

    class GrpcClient {
        +enviar_tarefa(tipo, dados)
        +recever_resultado()
    }

    Diretoria "1" --> "*" Projeto : aprova
    Diretoria "1" --> "*" Colaborador : cadastra
    Cliente "1" --> "*" Projeto : solicita
    Cliente "1" --> "*" Contrato : possui
    Cliente "1" --> "*" Prospeccao : rastreado
    Projeto "1" --> "1" Contrato : possui
    Projeto "1" --> "*" PrestadorServico : aloca
    Colaborador "1" --> "*" PrestadorServico : executa
    Projeto "*" --> "*" AreaAtuacao : envolve
    Colaborador "*" --> "*" AreaAtuacao : interesse
    Projeto "1" --> "*" Financeiro : gera
```

## Responsabilidades

| Classe | Responsabilidade |
|--------|-----------------|
| Diretoria | Aprovar projetos, cadastrar colaboradores, gerenciar mandatos |
| Colaborador | Disponibilidade, skills, interesse em áreas, horas AACC |
| PrestadorServico | Alocação em projetos, registro de horas |
| Cliente | Dados cadastrais, solicitação de projetos |
| Projeto | ciclo de vida (criação → aprovação → execução → conclusão) |
| Contrato | Vinculado ao projeto, cláusulas, anexos |
| Financeiro | Entradas/saídas, relatórios, categorias |
| AreaAtuacao | Silvicultura, Sistemas Inteligentes, Agroindústria, Mecanização |
| Prospeccao | ML com documentos, tags, tracker de empresas, notícias |
| AuthService | JWT, hash de senhas, controle de acesso |
| GrpcClient | Comunicação Rails ↔ Rust para tarefas pesadas |
