// Подключение к серверу MongoDB
const MongoClient = require("mongodb").MongoClient;
const url = "mongodb://localhost:27017";
const dbName = "exam_prep_db";

MongoClient.connect(url, { useNewUrlParser: true }, (err, client) => {
  if (err) throw err;

  const db = client.db(dbName);

  // Создание коллекции "Студенты"
  db.createCollection("students", (err, res) => {
    if (err) throw err;
    console.log("Коллекция 'Студенты' создана");
  });

  // Создание коллекции "Предметы"
  db.createCollection("subjects", (err, res) => {
    if (err) throw err;
    console.log("Коллекция 'Предметы' создана");
  });

  // Создание коллекции "Занятия"
  db.createCollection("classes", (err, res) => {
    if (err) throw err;
    console.log("Коллекция 'Занятия' создана");
  });

  // Создание коллекции "Задания"
  db.createCollection("assignments", (err, res) => {
    if (err) throw err;
    console.log("Коллекция 'Задания' создана");
  });

  // Создание коллекции "Оценки"
  db.createCollection("grades", (err, res) => {
    if (err) throw err;
    console.log("Коллекция 'Оценки' создана");
  });

  // Закрытие соединения с базой данных
  client.close();
});


const MongoClient = require("mongodb").MongoClient;
const url = "mongodb://localhost:27017";
const dbName = "exam_prep_db";

MongoClient.connect(url, { useNewUrlParser: true }, (err, client) => {
  if (err) throw err;

  const db = client.db(dbName);

  // Пример добавления студента в коллекцию "Студенты"
  const student = {
    имя: "Иван",
    фамилия: "Иванов",
    курс: 3,
    группа: "Группа A",
    email: "ivan@example.com",
    дата_рождения: new Date("1995-05-15"),
  };

  db.collection("students").insertOne(student, (err, res) => {
    if (err) throw err;
    console.log("Студент добавлен");
  });

  // Закрытие соединения с базой данных
  client.close();
});
