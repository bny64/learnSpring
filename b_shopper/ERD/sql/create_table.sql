CREATE TABLE user (
seq INT UNIQUE NOT NULL AUTO_INCREMENT,
id VARCHAR(30) UNIQUE NOT NULL, 
password VARCHAR(200) NOT NULL,
email VARCHAR(50) NOT NULL UNIQUE,
address TEXT,
userType VARCHAR(1) NOT NULL DEFAULT 'G',
userClass VARCHAR(1) NOT NULL DEFAULT 'B',
regDate DATETIME DEFAULT NOW() NOT NULL,
PRIMARY KEY(seq)
);

CREATE TABLE topCategory (
seq INT UNIQUE NOT NULL AUTO_INCREMENT,
categoryNm VARCHAR(50) NOT NULL UNIQUE,
PRIMARY KEY(seq)
);

CREATE TABLE midCategory (
seq INT UNIQUE NOT NULL AUTO_INCREMENT,
parCateSeq INT NOT NULL,
categoryNm VARCHAR(50) NOT NULL,
PRIMARY KEY(seq),
FOREIGN KEY (parCateSeq)
    REFERENCES topCategory(seq) ON DELETE CASCADE
);

CREATE TABLE item (
seq INT UNIQUE NOT NULL AUTO_INCREMENT,
itemNm VARCHAR(100) NOT NULL,
itemPrice VARCHAR(50) NOT NULL,
brandNm VARCHAR(50),
content TEXT NOT NULL,
imgPath1 VARCHAR(200),
imgPath2 VARCHAR(200),
imgPath3 VARCHAR(200),
regDate DATETIME DEFAULT NOW() NOT NULL,
topCateSeq INT,
midCateSeq INT,
PRIMARY KEY(seq),
FOREIGN KEY(topCateSeq)
	REFERENCES topCategory(seq) ON DELETE SET NULL,
FOREIGN KEY(midCateSeq)
	REFERENCES midCategory(seq) ON DELETE SET NULL
);

CREATE TABLE wishlist (
seq INT UNIQUE NOT NULL AUTO_INCREMENT,
userSeq INT NOT NULL,
itemSeq INT NOT NULL,
PRIMARY KEY(seq),
FOREIGN KEY(userSeq)
	REFERENCES user(seq) ON DELETE CASCADE,
FOREIGN KEY(itemSeq)
	REFERENCES item(seq) ON DELETE CASCADE
);

CREATE TABLE cart (
seq INT UNIQUE NOT NULL AUTO_INCREMENT,
userSeq INT NOT NULL,
itemSeq INT NOT NULL,
quantity INT NOT NULL,
regDate DATETIME DEFAULT NOW() NOT NULL,
PRIMARY KEY(seq),
FOREIGN KEY(userSeq)
	REFERENCES user(seq) ON DELETE CASCADE,
FOREIGN KEY(itemSeq)
	REFERENCES item(seq) ON DELETE CASCADE
);

CREATE TABLE comment (
seq INT UNIQUE NOT NULL AUTO_INCREMENT,
userSeq INT NOT NULL,
itemSeq INT NOT NULL,
title VARCHAR(100) NOT NULL,
content TEXT NOT NULL,
regDate DATETIME DEFAULT NOW() NOT NULL,
PRIMARY KEY(seq),
FOREIGN KEY(userSeq)
	REFERENCES user(seq) ON DELETE CASCADE,
FOREIGN KEY(itemSeq)
	REFERENCES item(seq) ON DELETE CASCADE
);

CREATE TABLE checkout (
seq INT UNIQUE NOT NULL AUTO_INCREMENT,
userSeq INT NOT NULL,
itemSeq INT NOT NULL,
address VARCHAR(200) NOT NULL,
orderStatus VARCHAR(1) NOT NULL DEFAULT 'A',
transStatus VARCHAR(1) NOT NULL DEFAULT 'R',
exchangeStatus VARCHAR(1) NOT NULL DEFAULT 'N',
regDate DATETIME DEFAULT NOW() NOT NULL,
PRIMARY KEY(seq),
FOREIGN KEY(userSeq)
	REFERENCES user(seq) ON DELETE CASCADE,
FOREIGN KEY(itemSeq)
	REFERENCES item(seq) ON DELETE CASCADE
);

CREATE TABLE rating (
seq INT UNIQUE NOT NULL AUTO_INCREMENT,
userSeq INT NOT NULL,
itemSeq INT NOT NULL,
address VARCHAR(200) NOT NULL,
score INT NOT NULL DEFAULT 1,
regDate DATETIME DEFAULT NOW() NOT NULL,
PRIMARY KEY(seq),
FOREIGN KEY(userSeq)
	REFERENCES user(seq) ON DELETE CASCADE,
FOREIGN KEY(itemSeq)
	REFERENCES item(seq) ON DELETE CASCADE
);

ALTER TABLE user ADD COLUMN `name` VARCHAR(30) NOT NULL;
ALTER TABLE user MODIFY COLUMN `name` VARCHAR(30) NOT NULL AFTER `password`;

ALTER TABLE user ADD `joinType` VARCHAR(20) NOT NULL AFTER `userClass`;

CREATE TABLE loginLog (
	seq int NOT NULL AUTO_INCREMENT,
	id VARCHAR(30) NOT NULL,
	name VARCHAR(30) NOT NULL,
	loginType VARCHAR(20) NOT NULL,
	regDate DATETIME NOT NULL DEFAULT NOW() NOT NULL,
	PRIMARY KEY(seq)
)

ALTER TABLE user ADD COLUMN `userKey` VARCHAR(300) NOT NULL;