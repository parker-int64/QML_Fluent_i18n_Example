#include "appInfo.h"
#include "config.h"
#include "util.h"
#include <QDebug>


AppInfo::AppInfo(QObject *parent)
    : QObject{parent}
{
    writeVersionToFile("./conf/config.json");
}


QString AppInfo::getAppVersion() const {
    QString version = QString(tr("Version: %1.%2.%3"))
                          .arg(VERSION_MAJOR)
                          .arg(VERSION_MINOR)
                          .arg(VERSION_PATCH);


    return version;
}

void AppInfo::writeVersionToFile(const QString filePath) {

    QString version_str = QString("%1.%2.%3")
                              .arg(VERSION_MAJOR)
                              .arg(VERSION_MINOR)
                              .arg(VERSION_PATCH);

    Util::writeJson(filePath, "version", version_str);

}



