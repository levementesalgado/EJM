#include "api_client.h"
#include <QNetworkRequest>
#include <QJsonDocument>
#include <QJsonObject>

ApiClient::ApiClient(QObject *parent)
    : QObject(parent)
    , networkManager(new QNetworkAccessManager(this))
    , baseUrl("http://localhost:3000/api/v1")
{
    connect(networkManager, &QNetworkAccessManager::finished,
            this, &ApiClient::handleReply);
}

ApiClient::~ApiClient()
{
}

void ApiClient::setBaseUrl(const QString &url)
{
    baseUrl = url;
}

void ApiClient::setAuthToken(const QString &token)
{
    authToken = token;
}

void ApiClient::login(const QString &ra, const QString &senha)
{
    QJsonObject data;
    data["ra"] = ra;
    data["senha"] = senha;

    QNetworkRequest request(QUrl(baseUrl + "/auth/login"));
    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");
    networkManager->post(request, QJsonDocument(data).toJson());
}

void ApiClient::getDiretorias()
{
    QNetworkRequest request(QUrl(baseUrl + "/diretorias"));
    if (!authToken.isEmpty()) {
        request.setRawHeader("Authorization", ("Bearer " + authToken).toUtf8());
    }
    networkManager->get(request);
}

void ApiClient::createDiretoria(const QJsonObject &data)
{
    QNetworkRequest request(QUrl(baseUrl + "/diretorias"));
    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");
    if (!authToken.isEmpty()) {
        request.setRawHeader("Authorization", ("Bearer " + authToken).toUtf8());
    }
    networkManager->post(request, QJsonDocument(data).toJson());
}

void ApiClient::getColaboradores()
{
    QNetworkRequest request(QUrl(baseUrl + "/colaboradores"));
    if (!authToken.isEmpty()) {
        request.setRawHeader("Authorization", ("Bearer " + authToken).toUtf8());
    }
    networkManager->get(request);
}

void ApiClient::createColaborador(const QJsonObject &data)
{
    QNetworkRequest request(QUrl(baseUrl + "/colaboradores"));
    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");
    if (!authToken.isEmpty()) {
        request.setRawHeader("Authorization", ("Bearer " + authToken).toUtf8());
    }
    networkManager->post(request, QJsonDocument(data).toJson());
}

void ApiClient::getClientes()
{
    QNetworkRequest request(QUrl(baseUrl + "/clientes"));
    if (!authToken.isEmpty()) {
        request.setRawHeader("Authorization", ("Bearer " + authToken).toUtf8());
    }
    networkManager->get(request);
}

void ApiClient::createCliente(const QJsonObject &data)
{
    QNetworkRequest request(QUrl(baseUrl + "/clientes"));
    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");
    if (!authToken.isEmpty()) {
        request.setRawHeader("Authorization", ("Bearer " + authToken).toUtf8());
    }
    networkManager->post(request, QJsonDocument(data).toJson());
}

void ApiClient::getProjetos()
{
    QNetworkRequest request(QUrl(baseUrl + "/projetos"));
    if (!authToken.isEmpty()) {
        request.setRawHeader("Authorization", ("Bearer " + authToken).toUtf8());
    }
    networkManager->get(request);
}

void ApiClient::createProjeto(const QJsonObject &data)
{
    QNetworkRequest request(QUrl(baseUrl + "/projetos"));
    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");
    if (!authToken.isEmpty()) {
        request.setRawHeader("Authorization", ("Bearer " + authToken).toUtf8());
    }
    networkManager->post(request, QJsonDocument(data).toJson());
}

void ApiClient::aprovarProjeto(int id)
{
    QNetworkRequest request(QUrl(baseUrl + "/projetos/" + QString::number(id) + "/aprovar"));
    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");
    if (!authToken.isEmpty()) {
        request.setRawHeader("Authorization", ("Bearer " + authToken).toUtf8());
    }
    networkManager->sendCustomRequest(request, "PATCH", "");
}

void ApiClient::reprovarProjeto(int id)
{
    QNetworkRequest request(QUrl(baseUrl + "/projetos/" + QString::number(id) + "/reprovar"));
    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");
    if (!authToken.isEmpty()) {
        request.setRawHeader("Authorization", ("Bearer " + authToken).toUtf8());
    }
    networkManager->sendCustomRequest(request, "PATCH", "");
}

void ApiClient::getFinanceiros(int projetoId)
{
    QNetworkRequest request(QUrl(baseUrl + "/projetos/" + QString::number(projetoId) + "/financeiros"));
    if (!authToken.isEmpty()) {
        request.setRawHeader("Authorization", ("Bearer " + authToken).toUtf8());
    }
    networkManager->get(request);
}

void ApiClient::createFinanceiro(int projetoId, const QJsonObject &data)
{
    QNetworkRequest request(QUrl(baseUrl + "/projetos/" + QString::number(projetoId) + "/financeiros"));
    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");
    if (!authToken.isEmpty()) {
        request.setRawHeader("Authorization", ("Bearer " + authToken).toUtf8());
    }
    networkManager->post(request, QJsonDocument(data).toJson());
}

void ApiClient::getProspeccoes()
{
    QNetworkRequest request(QUrl(baseUrl + "/prospeccoes"));
    if (!authToken.isEmpty()) {
        request.setRawHeader("Authorization", ("Bearer " + authToken).toUtf8());
    }
    networkManager->get(request);
}

void ApiClient::analisarProspeccao(int id)
{
    QNetworkRequest request(QUrl(baseUrl + "/prospeccoes/" + QString::number(id) + "/analisar"));
    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");
    if (!authToken.isEmpty()) {
        request.setRawHeader("Authorization", ("Bearer " + authToken).toUtf8());
    }
    networkManager->sendCustomRequest(request, "POST", "");
}

void ApiClient::handleReply(QNetworkReply *reply)
{
    if (reply->error() == QNetworkReply::NoError) {
        QByteArray responseData = reply->readAll();
        QJsonDocument doc = QJsonDocument::fromJson(responseData);
        QJsonObject json = doc.object();

        if (reply->url().toString().contains("/auth/login")) {
            bool success = !json.contains("error");
            emit loginResponse(json, success);
        } else {
            emit dataReceived(json);
        }
    } else {
        emit errorOccurred(reply->errorString());
    }
    reply->deleteLater();
}
