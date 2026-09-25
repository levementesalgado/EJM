# Diagrama de Casos de Uso — EJM

```mermaid
graph TB
    subgraph "Sistema EJM"
        UC1[Cadastrar Colaborador]
        UC2[Gerenciar Diretoria]
        UC3[Cadastrar Cliente]
        UC4[Criar Projeto]
        UC5[Aprovar Projeto]
        UC6[Alocar Prestadores]
        UC7[Gerar Contrato]
        UC8[Controle Financeiro]
        UC9[Prospecção ML]
        UC10[Relatórios e Gráficos]
        UC11[Login/Autenticação]
        UC12[Backup Criptografado]
    end

    subgraph "Atores"
        D[Diretor]
        S[Secretário]
        A[Admin]
    end

    D --> UC1
    D --> UC2
    D --> UC3
    D --> UC4
    D --> UC5
    D --> UC6
    D --> UC7
    D --> UC8
    D --> UC9
    D --> UC10
    D --> UC11

    S --> UC1
    S --> UC3
    S --> UC4
    S --> UC11

    A --> UC2
    A --> UC12
    A --> UC11

    UC9 -->|Rust + ML| ML[Processamento ML]
    UC10 -->|Rust| G[Geração de Gráficos]
```

## Atos e Permissões

| Atores | Permissões |
|--------|-----------|
| **Diretor** | Tudo (aprovar projetos, alocar, financeiro, prospecção, relatórios) |
| **Secretário** | Cadastrar colaboradores, clientes, criar projetos |
| **Admin** | Gerenciar diretoria, backup, configurações do sistema |

## Fluxos Principais

### 1. Aprovação de Projeto
```
Cliente solicita → Diretor cria projeto → Diretor analisa → Aprova/Reprova → Aloca prestadores
```

### 2. Prospecção de Clientes
```
Documentos históricos → Rust processa ML → Gera tags → Rastreia empresa → Notícias da área → Período de contrato
```

### 3. Registro de Colaboradores
```
Diretor cadastra aluno → Define skills/interesses → Colaborador fica disponível para alocação
```

### 4. Controle Financeiro
```
Projeto gera entrada → Registra despesas → Cálculo de impostos → Relatório
```
