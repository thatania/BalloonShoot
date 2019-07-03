#ifndef DATA_H
#define DATA_H

#include <QObject>
#include <QJsonObject>
class Data : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int highscore READ highscore WRITE setHighscore NOTIFY highscoreChanged)
signals:
    void highscoreChanged();
public:
    explicit Data(QObject *parent = nullptr);
    Q_INVOKABLE int highscore();
    Q_INVOKABLE void setHighscore(int score);
    Q_INVOKABLE void read(const QJsonObject &json);
    Q_INVOKABLE void write(QJsonObject &json) const;
    Q_INVOKABLE void saveData();
    Q_INVOKABLE bool loadData();
protected:
    int m_highscore;
};

#endif // DATA_H
