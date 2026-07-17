CREATE TABLE Room (
    RoomType CHAR(1) PRIMARY KEY,
    RoomDesc VARCHAR(9)
) ENGINE=InnoDB;
CREATE TABLE Location (
    RoomID INT(2) PRIMARY KEY,
    Building VARCHAR(7) NOT NULL,
    RoomNo CHAR(3) NOT NULL UNIQUE,
    Capacity INT(2) CHECK (Capacity > 0),
    RoomType CHAR(1),
    CONSTRAINT fk_location_room
        FOREIGN KEY (RoomType) REFERENCES Room(RoomType)
) ENGINE=InnoDB;
CREATE TABLE Term (
    TermID CHAR(4) PRIMARY KEY,
    TermDesc VARCHAR(11),
    StartDate DATE,
    EndDate DATE
) ENGINE=InnoDB;
CREATE TABLE Major (
    MajorID INT(3) PRIMARY KEY,
    MajorDesc VARCHAR(25)
) ENGINE=InnoDB;
CREATE TABLE Course (
    CourseID VARCHAR(6) PRIMARY KEY,
    Title VARCHAR(20) UNIQUE,
    Credits INT(1) CHECK (Credits >= 0 AND Credits <= 4),
    PreReq VARCHAR(6),
    CONSTRAINT fk_course_prereq FOREIGN KEY (PreReq)
        REFERENCES Course (CourseID)
)  ENGINE=INNODB;
CREATE TABLE Department (
    DeptID INT(1) PRIMARY KEY,
    DeptName VARCHAR(20)
) ENGINE=InnoDB;
CREATE TABLE Faculty (
    FacultyID INT(3) PRIMARY KEY,
    Name VARCHAR(15) NOT NULL,
    RoomID INT(2),
    Phone CHAR(3) UNIQUE,
    DeptID INT(1),
    CONSTRAINT fk_faculty_location
        FOREIGN KEY (RoomID) REFERENCES Location(RoomID),
    CONSTRAINT fk_faculty_dept
        FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
) ENGINE=InnoDB;
CREATE TABLE Student (
    StudentID CHAR(5) PRIMARY KEY,
    Last VARCHAR(15) NOT NULL,
    First VARCHAR(15) NOT NULL,
    Street VARCHAR(25),
    City VARCHAR(15),
    State VARCHAR(2) DEFAULT 'NJ',
    Zip VARCHAR(5),
    StartTerm CHAR(4),
    Birthday DATE,
    FacultyID INT(3),
    MajorID INT(3),
    Phone CHAR(10),
    CONSTRAINT fk_student_term
        FOREIGN KEY (StartTerm) REFERENCES Term(TermID),
    CONSTRAINT fk_student_faculty
        FOREIGN KEY (FacultyID) REFERENCES Faculty(FacultyID),
    CONSTRAINT fk_student_major
        FOREIGN KEY (MajorID) REFERENCES Major(MajorID)
) ENGINE=InnoDB;
CREATE TABLE CrsSection (
    CsID INT(4) PRIMARY KEY,
    CourseID VARCHAR(6) NOT NULL,
    Section CHAR(2) NOT NULL,
    TermID CHAR(4) NOT NULL,
    FacultyID INT(3),
    Day VARCHAR(2),
    StartTime VARCHAR(5),
    EndTime VARCHAR(5),
    RoomID INT(2),
    MaxCount INT(2) CHECK (MaxCount > 0),
    CONSTRAINT fk_crs_course
        FOREIGN KEY (CourseID) REFERENCES Course(CourseID),
    CONSTRAINT fk_crs_term
        FOREIGN KEY (TermID) REFERENCES Term(TermID),
    CONSTRAINT fk_crs_faculty
        FOREIGN KEY (FacultyID) REFERENCES Faculty(FacultyID),
    CONSTRAINT fk_crs_location
        FOREIGN KEY (RoomID) REFERENCES Location(RoomID)
) ENGINE=InnoDB;
CREATE TABLE Registration (
    StudentID CHAR(5),
    CsID INT(4),
    Midterm CHAR(1),
    Final CHAR(1),
    RegStatus CHAR(1),
    PRIMARY KEY (StudentID, CsID),
    CONSTRAINT fk_reg_student
        FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    CONSTRAINT fk_reg_section
        FOREIGN KEY (CsID) REFERENCES CrsSection(CsID),
    CONSTRAINT chk_midterm
        CHECK (Midterm IN ('A','B','C','D','F','W')),
    CONSTRAINT chk_final
        CHECK (Final IN ('A','B','C','D','I','F','W')),
    CONSTRAINT chk_regstatus
        CHECK (RegStatus IN ('X','R','W'))
) ENGINE=InnoDB;

