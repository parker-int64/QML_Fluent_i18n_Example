#include <QJsonObject>
#include <QCoreApplication>
#include <QQmlEngine>
#include <QQmlContext>
#include <QFile>
#include <QDir>
#include <QJsonDocument>
#include "localization.h"
#include "util.h"

Localization::Localization(QObject *parent, QQmlEngine *engine)
    : QObject{parent} , m_translator(nullptr)
{
    m_engine = engine;

}

Q_INVOKABLE void Localization::getSysLocaleInfo(const QString filePath){

    Util::writeJson(filePath, "system_locale", QLocale::system().name());
}

// read config file from external file: conf/config.json
Q_INVOKABLE void Localization::loadDisplayLanguage(QString filePath) {

    QString localeName;
    Util::readJson(filePath, "display_language", localeName);


    if( !installTranslator(QLocale(localeName)) ){
        return ;
    }

    m_engine->retranslate();
}


// change display language immediately
Q_INVOKABLE void Localization::changeDisplayLanguage(const QString localeName, QString filePath) {

    if( !installTranslator(QLocale(localeName)) ){
        return ;
    }

    m_engine->retranslate();

    Util::writeJson(filePath, "display_language", localeName);
}


// install the given translator
bool Localization::installTranslator(const QLocale localeName){

    QTranslator *translator = new QTranslator(qApp);

    if( m_translator ){
        QCoreApplication::removeTranslator(m_translator);
        m_translator->deleteLater();
        m_translator = nullptr;
    }


    if( !translator->load( localeName , QLatin1String("lang"), QLatin1String("_"), QLatin1String(":/i18n"))){
        translator = nullptr;
        qDebug() << "[ERROR] Error load translations..." << Qt::endl;
        return false;
    }

    m_translator = translator;

    QCoreApplication::installTranslator(translator);


    return true;
}
