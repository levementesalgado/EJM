#include "mainwindow.h"
#include <QMenuBar>
#include <QStatusBar>
#include <QVBoxLayout>
#include <QHBoxLayout>
#include <QPushButton>
#include <QLabel>
#include <QWidget>

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , apiClient(new ApiClient(this))
{
    setupUI();
    setupMenuBar();
    setupStatusBar();
    setWindowTitle("EJM - Sistema de Gestão");
    resize(1200, 800);
}

MainWindow::~MainWindow()
{
}

void MainWindow::setupUI()
{
    stackedWidget = new QStackedWidget(this);
    setCentralWidget(stackedWidget);

    // Tela inicial
    QWidget *homeWidget = new QWidget;
    QVBoxLayout *homeLayout = new QVBoxLayout(homeWidget);
    
    QLabel *titleLabel = new QLabel("EJM - Sistema de Gestão");
    titleLabel->setAlignment(Qt::AlignCenter);
    titleLabel->setStyleSheet("font-size: 24px; font-weight: bold; margin: 20px;");
    homeLayout->addWidget(titleLabel);

    QHBoxLayout *buttonLayout = new QHBoxLayout;
    
    QPushButton *projetosBtn = new QPushButton("Projetos");
    projetosBtn->setMinimumHeight(100);
    connect(projetosBtn, &QPushButton::clicked, this, &MainWindow::showProjetos);
    buttonLayout->addWidget(projetosBtn);

    QPushButton *colaboradoresBtn = new QPushButton("Colaboradores");
    colaboradoresBtn->setMinimumHeight(100);
    connect(colaboradoresBtn, &QPushButton::clicked, this, &MainWindow::showColaboradores);
    buttonLayout->addWidget(colaboradoresBtn);

    QPushButton *clientesBtn = new QPushButton("Clientes");
    clientesBtn->setMinimumHeight(100);
    connect(clientesBtn, &QPushButton::clicked, this, &MainWindow::showClientes);
    buttonLayout->addWidget(clientesBtn);

    homeLayout->addLayout(buttonLayout);

    QHBoxLayout *buttonLayout2 = new QHBoxLayout;
    
    QPushButton *financeiroBtn = new QPushButton("Financeiro");
    financeiroBtn->setMinimumHeight(100);
    connect(financeiroBtn, &QPushButton::clicked, this, &MainWindow::showFinanceiro);
    buttonLayout2->addWidget(financeiroBtn);

    QPushButton *prospeccaoBtn = new QPushButton("Prospecção");
    prospeccaoBtn->setMinimumHeight(100);
    connect(prospeccaoBtn, &QPushButton::clicked, this, &MainWindow::showProspeccao);
    buttonLayout2->addWidget(prospeccaoBtn);

    homeLayout->addLayout(buttonLayout2);

    stackedWidget->addWidget(homeWidget);
}

void MainWindow::setupMenuBar()
{
    QMenuBar *menuBar = this->menuBar();

    QMenu *fileMenu = menuBar->addMenu("Arquivo");
    fileMenu->addAction("Sair", this, &MainWindow::logout);

    QMenu *cadastroMenu = menuBar->addMenu("Cadastro");
    cadastroMenu->addAction("Diretoria");
    cadastroMenu->addAction("Colaboradores");
    cadastroMenu->addAction("Clientes");

    QMenu *projetoMenu = menuBar->addMenu("Projetos");
    projetoMenu->addAction("Novo Projeto");
    projetoMenu->addAction("Aprovar Projeto");

    QMenu *financeiroMenu = menuBar->addMenu("Financeiro");
    financeiroMenu->addAction("Relatórios");
    financeiroMenu->addAction("Despesas");

    QMenu *helpMenu = menuBar->addMenu("Ajuda");
    helpMenu->addAction("Sobre");
}

void MainWindow::setupStatusBar()
{
    statusBar()->showMessage("Pronto");
}

void MainWindow::showProjetos()
{
    statusBar()->showMessage("Carregando projetos...");
    // TODO: Implementar tela de projetos
}

void MainWindow::showColaboradores()
{
    statusBar()->showMessage("Carregando colaboradores...");
    // TODO: Implementar tela de colaboradores
}

void MainWindow::showClientes()
{
    statusBar()->showMessage("Carregando clientes...");
    // TODO: Implementar tela de clientes
}

void MainWindow::showFinanceiro()
{
    statusBar()->showMessage("Carregando financeiro...");
    // TODO: Implementar tela financeira
}

void MainWindow::showProspeccao()
{
    statusBar()->showMessage("Carregando prospecção...");
    // TODO: Implementar tela de prospecção
}

void MainWindow::logout()
{
    // TODO: Implementar logout
    close();
}
