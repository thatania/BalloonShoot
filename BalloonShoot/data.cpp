#include "data.h"
#include <QFile>
#include <QJsonDocument>
Data::Data(QObject *parent) : QObject(parent)
{
//    m_highscore=0;
}

int Data::highscore()
{
    return m_highscore;
}

void Data::setHighscore(int score)
{
    if(score>m_highscore){
        m_highscore=score;
    }
}

void Data::read(const QJsonObject &json)
{
    if (json.contains("highscore"))
        m_highscore = json["highscore"].toInt();

}

void Data::write(QJsonObject &json) const
{
    json["highscore"] = m_highscore;
}

void Data::saveData()
{
    QFile saveFile(QStringLiteral("save.json"));

    if (!saveFile.open(QIODevice::ReadWrite)) {
        qWarning("Couldn't open save file.");
        return ;
    }

    QJsonObject gameObject;
    write(gameObject);
    QJsonDocument saveDoc(gameObject);
    saveFile.write(saveDoc.toJson());
}

bool Data::loadData()
{
    QFile loadFile(QStringLiteral("save.json"));

    if (!loadFile.open(QIODevice::ReadOnly)) {
        qWarning("Couldn't open save file.");
        return false;
    }

    QByteArray saveData = loadFile.readAll();

    QJsonDocument loadDoc(QJsonDocument::fromJson(saveData));

    read(loadDoc.object());
    return true;
}
