#include <QApplication>
#include "mainwindow.h"
#include "loginwindow.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    app.setApplicationName("EJM");
    app.setApplicationVersion("0.1.0");

    LoginWindow loginWindow;
    MainWindow mainWindow;

    QObject::connect(&loginWindow, &LoginWindow::loginSuccess, [&mainWindow](const QString &token) {
        mainWindow.show();
    });

    loginWindow.show();

    return app.exec();
}
