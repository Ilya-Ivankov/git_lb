//Пользователи (Users): Эта таблица будет содержать информацию о пользователях системы подготовки к экзамену.
CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    Email VARCHAR(255),
    Password VARCHAR(255)
);
//Курсы (Courses): Таблица, в которой будут храниться данные о курсах, доступных для подготовки.
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(255),
    Description TEXT
);
//Расписание (Schedule): Эта таблица будет содержать информацию о расписании занятий по курсам.
CREATE TABLE Schedule (
    ScheduleID INT PRIMARY KEY,
    CourseID INT,
    Date DATE,
    StartTime TIME,
    EndTime TIME,
    Location VARCHAR(255),
    FOREIGN KEY (CourseID) REFERENCES Courses (CourseID)
);
//Оценки (Grades): Таблица, где будут храниться оценки пользователей по выполненным заданиям и экзаменам.
CREATE TABLE Grades (
    GradeID INT PRIMARY KEY,
    UserID INT,
    CourseID INT,
    AssignmentName VARCHAR(255),
    Score DECIMAL(5, 2),
    FOREIGN KEY (UserID) REFERENCES Users (UserID),
    FOREIGN KEY (CourseID) REFERENCES Courses (CourseID)
);
//Материалы (Materials): Таблица для хранения учебных материалов, таких как лекции, учебники и дополнительные ресурсы.
CREATE TABLE Materials (
    MaterialID INT PRIMARY KEY,
    CourseID INT,
    MaterialName VARCHAR(255),
    FileType VARCHAR(10),
    FileContent BLOB,
    FOREIGN KEY (CourseID) REFERENCES Courses (CourseID)
);
//Задания (Assignments): Эта таблица будет содержать информацию о заданиях, которые пользователи должны выполнить в процессе подготовки.
CREATE TABLE Assignments (
    AssignmentID INT PRIMARY KEY,
    CourseID INT,
    AssignmentName VARCHAR(255),
    Description TEXT,
    Deadline DATE,
    FOREIGN KEY (CourseID) REFERENCES Courses (CourseID)
);
