#ifndef SQLHELPER_H
#define SQLHELPER_H

#include <Qt>
#include <QSqlQuery>
#include <QSqlQueryModel>

namespace SQLHelper {
    template <typename T> QString generateArrayBinds(QString prefix, const QList<T>& list, QHash<QString, QVariant> &binds)
    {
        QStringList bindResults;
        for (qsizetype i = 0; i < list.length(); i++) {
            QString name = prefix + QString::number(i);
            bindResults.push_back(name);
            binds[name] = list.at(i);
        }

        return bindResults.join(",");
    }

    void applyBindMaps(QSqlQuery& query, const QHash<QString, QVariant>& binds);
    void initializeDatabase(QSqlDatabase& db);
    void clearDatabase(QSqlDatabase& db);
    QString generateId(const QString& table, const QString &primaryKey, const QString& prefix);
    QList<int> getModelDataIntList(const QAbstractItemModel* model, int role);
    int getIndexByIntData(const QAbstractItemModel* model, int role, int value);
}

#endif // SQLHELPER_H
