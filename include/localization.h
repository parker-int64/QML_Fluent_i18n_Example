#ifndef LOCALIZATION_H
#define LOCALIZATION_H

#include <QQmlEngine>
#include <QObject>
#include <qqmlregistration.h>
#include <QLocale>
#include <QTranslator>

class Localization : public QObject
{
    Q_OBJECT
    QML_ELEMENT

public:
    explicit Localization(QObject *parent = nullptr, QQmlEngine *engine = nullptr);


    Q_INVOKABLE void getSysLocaleInfo(const QString filePath = "./conf/config.json");

    Q_INVOKABLE void loadDisplayLanguage(const QString filePath = "./conf/config.json");

    Q_INVOKABLE void changeDisplayLanguage(const QString localeName, const QString filePath = "./conf/config.json");

    bool installTranslator(const QLocale localeName);



signals:


private:
    QTranslator *m_translator;
    QQmlEngine *m_engine;


};

#endif // LOCALIZATION_H
