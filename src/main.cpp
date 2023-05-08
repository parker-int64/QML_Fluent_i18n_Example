#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <QQmlContext>
#include "appInfo.h"
#include "localization.h"

int main(int argc, char *argv[])
{
//    //将样式设置为Basic，不然会导致组件显示异常
//    qputenv("QT_QUICK_CONTROLS_STYLE","Basic");
//    //6.4及以下监听系统深色模式变化
//#ifdef Q_OS_WIN
//    qputenv("QT_QPA_PLATFORM","windows:darkmode=2");
//#endif

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    qmlRegisterType<AppInfo>("AppInfo", 1, 0, "AppInfo");

    // qmlRegisterType<Localization>("Localization", 1, 0, "Localization"); // Q: It can be destoryed in child page??


    Localization localization(nullptr, &engine);

    // system perferred language


//    QTranslator translator;

//    // system perferred language
//    if ( !translator.load(QLocale("zh_CN"), QLatin1String("lang"), QLatin1String("_"), QLatin1String(":/i18n")) ){


//        qDebug() << "[ERROR] Error load translations..." << Qt::endl;
//    }

//    QCoreApplication::installTranslator(&translator);

    engine.rootContext()->setContextProperty("localization", &localization);



    const QUrl url(u"qrc:/FluentExample/qml/App.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
