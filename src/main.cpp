#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QTranslator>

#include <QDir>


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

    QTranslator translator;


    // system perferred language
    if ( !translator.load(QLocale(), QLatin1String("lang"), QLatin1String("_"), QLatin1String(":/i18n")) ){


        qDebug() << "[ERROR] Error load translations..." << Qt::endl;
    }

    QCoreApplication::installTranslator(&translator);


    const QUrl url(u"qrc:/FluentExample/qml/App.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
