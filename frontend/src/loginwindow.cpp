#include "loginwindow.h"
#include <QVBoxLayout>
#include <QHBoxLayout>
#include <QMessageBox>

LoginWindow::LoginWindow(QWidget *parent)
    : QDialog(parent)
    , apiClient(new ApiClient(this))
{
    setupUI();
    setWindowTitle("EJM - Login");
    setFixedSize(300, 200);
}

LoginWindow::~LoginWindow()
{
}

void LoginWindow::setupUI()
{
    QVBoxLayout *mainLayout = new QVBoxLayout(this);

    QLabel *titleLabel = new QLabel("Login");
    titleLabel->setAlignment(Qt::AlignCenter);
    titleLabel->setStyleSheet("font-size: 18px; font-weight: bold; margin: 10px;");
    mainLayout->addWidget(titleLabel);

    QHBoxLayout *raLayout = new QHBoxLayout;
    QLabel *raLabel = new QLabel("RA:");
    raInput = new QLineEdit;
    raLayout->addWidget(raLabel);
    raLayout->addWidget(raInput);
    mainLayout->addLayout(raLayout);

    QHBoxLayout *senhaLayout = new QHBoxLayout;
    QLabel *senhaLabel = new QLabel("Senha:");
    senhaInput = new QLineEdit;
    senhaInput->setEchoMode(QLineEdit::Password);
    senhaLayout->addWidget(senhaLabel);
    senhaLayout->addWidget(senhaInput);
    mainLayout->addLayout(senhaLayout);

    loginButton = new QPushButton("Entrar");
    connect(loginButton, &QPushButton::clicked, this, &LoginWindow::attemptLogin);
    mainLayout->addWidget(loginButton);
}

void LoginWindow::attemptLogin()
{
    QString ra = raInput->text();
    QString senha = senhaInput->text();

    if (ra.isEmpty() || senha.isEmpty()) {
        QMessageBox::warning(this, "Erro", "Preencha todos os campos");
        return;
    }

    // TODO: Implementar chamada API real
    // Por enquanto, simula login
    emit loginSuccess("token_simulado");
    accept();
}
