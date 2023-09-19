// Хаб Пользователей (UsersHub): Хранит информацию о пользователях системы подготовки к экзамену.
CREATE TABLE UsersHub (
    UsersHubID INT PRIMARY KEY,
    UserKey INT,
    LoadDate DATETIME
);

//Хаб Курсов (CoursesHub): Хранит информацию о курсах подготовки.
CREATE TABLE CoursesHub (
    CoursesHubID INT PRIMARY KEY,
    CourseKey INT,
    LoadDate DATETIME
);

//Хаб Материалов (MaterialsHub): Хранит информацию о учебных материалах.
CREATE TABLE MaterialsHub (
    MaterialsHubID INT PRIMARY KEY,
    MaterialKey INT,
    LoadDate DATETIME
);

//Хаб Материалов (MaterialsHub): Хранит информацию о учебных материалах.
CREATE TABLE MaterialsHub (
    MaterialsHubID INT PRIMARY KEY,
    MaterialKey INT,
    LoadDate DATETIME
);

//Линия Расписания (ScheduleLink): Связывает пользователей с расписанием занятий по курсам.
CREATE TABLE ScheduleLink (
    ScheduleLinkID INT PRIMARY KEY,
    UsersHubID INT,
    CoursesHubID INT,
    StartDate DATE,
    EndDate DATE,
    LoadDate DATETIME,
    FOREIGN KEY (UsersHubID) REFERENCES UsersHub (UsersHubID),
    FOREIGN KEY (CoursesHubID) REFERENCES CoursesHub (CoursesHubID)
);

//Линия Оценок (GradesLink): Связывает пользователей с оценками по курсам.
CREATE TABLE GradesLink (
    GradesLinkID INT PRIMARY KEY,
    UsersHubID INT,
    CoursesHubID INT,
    AssignmentKey INT,
    Score DECIMAL(5, 2),
    LoadDate DATETIME,
    FOREIGN KEY (UsersHubID) REFERENCES UsersHub (UsersHubID),
    FOREIGN KEY (CoursesHubID) REFERENCES CoursesHub (CoursesHubID),
    FOREIGN KEY (AssignmentKey) REFERENCES AssignmentsLink (AssignmentsLinkID)
);

//Линия Материалов (MaterialsLink): Связывает курсы с учебными материалами.
CREATE TABLE MaterialsLink (
    MaterialsLinkID INT PRIMARY KEY,
    CoursesHubID INT,
    MaterialKey INT,
    LoadDate DATETIME,
    FOREIGN KEY (CoursesHubID) REFERENCES CoursesHub (CoursesHubID),
    FOREIGN KEY (MaterialKey) REFERENCES MaterialsHub (MaterialsHubID)
);

//Хранилище Расписания (ScheduleSatellite): Хранит подробную информацию о расписании занятий.
CREATE TABLE ScheduleSatellite (
    ScheduleSatelliteID INT PRIMARY KEY,
    ScheduleLinkID INT,
    Date DATE,
    StartTime TIME,
    EndTime TIME,
    Location VARCHAR(255),
    LoadDate DATETIME,
    FOREIGN KEY (ScheduleLinkID) REFERENCES ScheduleLink (ScheduleLinkID)
);

//Хранилище Оценок (GradesSatellite): Хранит информацию о полученных оценках.
CREATE TABLE GradesSatellite (
    GradesSatelliteID INT PRIMARY KEY,
    GradesLinkID INT,
    AssignmentName VARCHAR(255),
    LoadDate DATETIME,
    FOREIGN KEY (GradesLinkID) REFERENCES GradesLink (GradesLinkID)
);

//Хранилище Материалов (MaterialsSatellite): Хранит информацию о учебных материалах.
CREATE TABLE MaterialsSatellite (
    MaterialsSatelliteID INT PRIMARY KEY,
    MaterialsLinkID INT,
    MaterialName VARCHAR(255),
    FileType VARCHAR(10),
    FileContent BLOB,
    LoadDate DATETIME,
    FOREIGN KEY (MaterialsLinkID) REFERENCES MaterialsLink (MaterialsLinkID)
);

//Дополнительные таблицы

//Линия Заданий (AssignmentsLink): Связывает курсы с заданиями.
CREATE TABLE AssignmentsLink (
    AssignmentsLinkID INT PRIMARY KEY,
    CoursesHubID INT,
    AssignmentKey INT,
    LoadDate DATETIME,
    FOREIGN KEY (CoursesHubID) REFERENCES CoursesHub (CoursesHubID)
);

//Хранилище Заданий (AssignmentsSatellite): Хранит информацию о заданиях.
CREATE TABLE AssignmentsSatellite (
    AssignmentsSatelliteID INT PRIMARY KEY,
    AssignmentsLinkID INT,
    AssignmentName VARCHAR(255),
    Description TEXT,
    Deadline DATE,
    LoadDate DATETIME,
    FOREIGN KEY (AssignmentsLinkID) REFERENCES AssignmentsLink (AssignmentsLinkID)
);



