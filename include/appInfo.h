#ifndef APP_INFO_H
#define APP_INFO_H

#include <QObject>

class AppInfo : public QObject
{
    Q_OBJECT

public:
    explicit AppInfo(QObject *parent = nullptr);

    Q_INVOKABLE QString getAppVersion() const;

    void writeVersionToFile(const QString filePath);
signals:

};

#endif // APP_INFO_H
