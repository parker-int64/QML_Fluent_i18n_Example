#ifndef UTIL_H
#define UTIL_H

#include <QObject>

class Util
{
public:
    Util() = default;
    static bool readJson(const QString &filePath, const QString &key, QString &value);  // read signle key and value from a json file
    static bool writeJson(const QString &filePath, const QString &key, const QString &value); // write single key and value to a json file
};

#endif // UTIL_H
