CREATE TABLE [Users](
    UserID INT PRIMARY KEY ,
    Username VARCHAR(50) NOT NULL UNIQUE,
    Email VARCHAR(50) NOT NULL UNIQUE,
    DOB DATE NOT NULL,
    JoinDate TIMESTAMP ,
	InteractionID INT NOT NULL,
    Gender VARCHAR(100) CHECK (Gender IN ('Male', 'Female', 'Other')) NOT NULL
);

-- Post Table
CREATE TABLE Post (
    PostID INT PRIMARY KEY,
    PostDate TIMESTAMP ,
    Content TEXT NOT NULL,
    Visibility VARCHAR(10) NOT NULL DEFAULT 'Public' CHECK (Visibility IN ('Public', 'Private')),
    UserID INT NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users
);
-- Comment Table
CREATE TABLE Comment (
    CommentID INT PRIMARY KEY ,
    CommentDate TIMESTAMP ,
    Content TEXT NOT NULL,
    UserID INT NOT NULL,
    PostID INT NOT NULL,
    FOREIGN KEY  (UserID) REFERENCES Users,
    FOREIGN KEY  (PostID) REFERENCES Post
);

-- Interaction Table
CREATE TABLE Interaction (
    InteractionID INT PRIMARY KEY,
    Type VARCHAR(100) NOT NULL CHECK (Type IN ('Like', 'Comment', 'Share')),
    InteractionDate TIMESTAMP,
    PostID INT NOT NULL,
    FOREIGN KEY (PostID) REFERENCES Post
);

-- UserPost Table (Many-to-Many Relationship)
CREATE TABLE UserPost (
    UserID INT NOT NULL,
    PostID INT NOT NULL,
    PRIMARY KEY (UserID, PostID),
    FOREIGN KEY (UserID) REFERENCES Users,
    FOREIGN KEY (PostID) REFERENCES Post
	);

ALTER TABLE Users 
ADD InteractionID INT;

ALTER TABLE Users 
ADD CONSTRAINT FK_Users_Interaction 
FOREIGN KEY (InteractionID) REFERENCES Interaction
