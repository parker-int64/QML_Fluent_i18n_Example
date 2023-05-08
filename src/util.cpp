#include "util.h"
#include <QJsonDocument>
#include <QJsonObject>
#include <QFile>
#include <QDir>
#include <QDebug>


// stored the result to value
bool Util::readJson(const QString &filePath, const QString &key, QString &value){
    QFile file(filePath);

    if( !file.open(QIODevice::ReadOnly) ){
        qDebug() << "[Error] open file: " << QDir::currentPath() + "/" + filePath  << Qt::endl;
        return false;
    }

    QJsonParseError err;
    QJsonDocument jsonDoc = QJsonDocument::fromJson(file.readAll(), &err);

    if(err.error !=  QJsonParseError::NoError){
        qDebug()<<"[Error] Json file parse error" << err.errorString() << Qt::endl;
        return false;
    }

    QJsonObject obj = jsonDoc.object();

    value = obj[key].toString();


    file.flush();
    file.close();

    return true;

}


// write "key" : "value" in json file
// if key exist, modify the value only
bool Util::writeJson(const QString &filePath, const QString &key, const QString &value){
    QFile file(filePath);

    if( !file.open(QIODevice::ReadWrite) ){
        qDebug() << "[Error] open file: " << QDir::currentPath() + "/" + filePath  << Qt::endl;
        return false;
    }

    QJsonParseError err;
    QJsonDocument jsonDoc = QJsonDocument::fromJson(file.readAll(), &err);
    QJsonObject obj;


    if(err.error !=  QJsonParseError::NoError){
        qDebug()<< "[Error] Json file parse error" << err.errorString() << Qt::endl;
    }
    else {

        obj = jsonDoc.object();
        if( obj.contains(key) ){
            QJsonValueRef ref = obj.find(key).value();
            ref = QJsonValue(value);
        } else {
            obj[key] = value;
        }
    }


    jsonDoc.setObject(obj);
    file.seek(0); // sets the current position to 0
    file.write(jsonDoc.toJson());


    file.flush();
    file.close();

    return true;

}
