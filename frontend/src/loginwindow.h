#ifndef LOGINWINDOW_H
#define LOGINWINDOW_H

#include <QDialog>
#include <QLineEdit>
#include <QPushButton>
#include <QLabel>
#include "api_client.h"

class LoginWindow : public QDialog
{
    Q_OBJECT

public:
    LoginWindow(QWidget *parent = nullptr);
    ~LoginWindow();

signals:
    void loginSuccess(const QString &token);

private slots:
    void attemptLogin();

private:
    void setupUI();

    QLineEdit *raInput;
    QLineEdit *senhaInput;
    QPushButton *loginButton;
    ApiClient *apiClient;
};

#endif // LOGINWINDOW_H
