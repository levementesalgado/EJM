#ifndef API_CLIENT_H
#define API_CLIENT_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QJsonDocument>

class ApiClient : public QObject
{
    Q_OBJECT

public:
    explicit ApiClient(QObject *parent = nullptr);
    ~ApiClient();

    void setBaseUrl(const QString &url);
    void setAuthToken(const QString &token);

    // Auth
    void login(const QString &ra, const QString &senha);

    // Diretoria
    void getDiretorias();
    void createDiretoria(const QJsonObject &data);

    // Colaboradores
    void getColaboradores();
    void createColaborador(const QJsonObject &data);

    // Clientes
    void getClientes();
    void createCliente(const QJsonObject &data);

    // Projetos
    void getProjetos();
    void createProjeto(const QJsonObject &data);
    void aprovarProjeto(int id);
    void reprovarProjeto(int id);

    // Financeiro
    void getFinanceiros(int projetoId);
    void createFinanceiro(int projetoId, const QJsonObject &data);

    // Prospeccao
    void getProspeccoes();
    void analisarProspeccao(int id);

signals:
    void loginResponse(const QJsonObject &response, bool success);
    void dataReceived(const QJsonObject &data);
    void errorOccurred(const QString &error);

private slots:
    void handleReply(QNetworkReply *reply);

private:
    QNetworkAccessManager *networkManager;
    QString baseUrl;
    QString authToken;
};

#endif // API_CLIENT_H
