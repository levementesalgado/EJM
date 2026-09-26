#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QStackedWidget>
#include <QPushButton>
#include <QLabel>
#include <QVBoxLayout>
#include "api_client.h"

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    MainWindow(QWidget *parent = nullptr);
    ~MainWindow();

private slots:
    void showProjetos();
    void showColaboradores();
    void showClientes();
    void showFinanceiro();
    void showProspeccao();
    void logout();

private:
    void setupUI();
    void setupMenuBar();
    void setupStatusBar();

    QStackedWidget *stackedWidget;
    ApiClient *apiClient;
    QString authToken;
};

#endif // MAINWINDOW_H
