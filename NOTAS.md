# EJM - Sistema de Gestão para Empresa Júnior

## Stack Definida
- **Backend:** Ruby on Rails API only (regra de negócio simples)
- **Tarefas pesadas:** Rust (ML, cálculos, geração de dados para gráficos)
- **Frontend:** Qt C++ (desktop app, gráficos, UI fluida e encaixada)
- **Banco:** PostgreSQL local + backup criptografado
- **Comunicação:** gRPC (Rails orquestra, Rust executa tarefas pesadas)
- **Auth:** JWT + hash senhas, login específico para cadastrar novas contas (secretários, diretores). 0 web.
- **Deploy:** Desktop app, sem deploy cloud
- **Versionamento:** GitHub privado — github.com/levardimentesalgado

## Contexto
- Empresa Júnior da **Fatec de Capão Bonito - SP**
- 15 anos de documentação (contratos, registros)
- **23 sócios** da diretoria
- **Alunos da Fatec** são os prestadores de serviço

## Áreas de Atuação
1. Silvicultura
2. Sistemas Inteligentes
3. Agroindústria
4. Mecanização

## Entidades Detalhadas

### Diretoria
- **Campos:** nome, RA, curso, cargo na diretoria, idade, disponibilidade
- **Regra:** apenas 1 cargo por membro
- **Mandato:** variável (aberto)

### Prestadores de Serviço
- Alunos Fatec **já alocados** em projetos (executam os serviços)

### Colaboradores
- Alunos **interessados** em participar, mas ainda não alocados em projeto
- Cadastrados pela diretoria

### Clientes
- (empresas da região de Capão Bonito)

### Projetos
- **Campos:** título, descrição, área(s) de atuação, cliente, valor, prazo, status, alunos registrados
- **Regra:** pode ser multidisciplinar (várias áreas)

### Contratos
- **Regra:** sempre vinculado a um projeto específico
- **Campos:** valor, período, cláusulas, status, anexo

### Clientes
- **Campos:** razão social, CNPJ, telefone, email, endereço, contato responsável

### Colaboradores
- **Campos:** nome, RA, curso, período, skills/competências, áreas de interesse, horas AACC
- **Regra:** pode estar em vários projetos, respeitando limite legal de horas de serviço

### Áreas de Atuação
- Silvicultura, Sistemas Inteligentes, Agroindústria, Mecanização

## Fluxos Críticos
1. **Aprovação de Projetos:** cliente solicita → diretoria analisa → aprova/reprova → aloca alunos
2. **Pesquisa de possíveis clientes (prospecção):** ML com documentos históricos, tags por cliente, tracker por nome de empresa, notícias atuais da área, períodos de contrato
3. **Registro de colaboradores:** diretoria cadastra alunos interessados

## Financeiro
- **Campos:** entradas por projeto, saídas (pagamento a alunos), custos fixos, orçamentos, despesas, infraestrutura (faculdade), eventos
- **Regras:** variáveis editáveis, controle de recebimento (valor pago, impostos, descontos)
- **Centros de custo:** em aberto (flexível)

## Observações

