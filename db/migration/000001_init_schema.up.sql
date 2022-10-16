CREATE TABLE `accounts` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `account_id` varchar(10) NOT NULL,
  `password` varchar(32) COMMENT 'the password md5',
  `salt` varchar(32),
  `role` tinyint COMMENT '0 admin 1 student 2 ea',
  `is_new` boolean DEFAULT true
);

CREATE TABLE `students` (
  `id` int PRIMARY KEY,
  `name` varchar(128),
  `student_id` varchar(10),
  `grade` int,
  `gender` tinyint,
  `major` tinyint,
  `class` varchar(32),
  `code` varchar(5),
  `will` boolean DEFAULT false,
  `payed` boolean DEFAULT false,
  `check_in` boolean DEFAULT false
);

CREATE TABLE `admins` (
  `id` int PRIMARY KEY,
  `name` varchar(128)
);

CREATE TABLE `eas` (
  `id` int PRIMARY KEY,
  `name` varchar(128)
);

CREATE TABLE `entries` (
  `id` int PRIMARY KEY,
  `s_id` int NOT NULL,
  `building_id` int NOT NULL,
  `send_time` timestamp NOT NULL,
  `group_num` tinyint,
  `partner1` varchar(10),
  `partner2` varchar(10),
  `partner3` varchar(10),
  `status` boolean,
  `errorCode` smallint
);

CREATE TABLE `buildings` (
  `id` int PRIMARY KEY,
  `type` tinyint,
  `female_num` int,
  `male_num` int,
  `female_thisyear` int,
  `male_thisyear` int
);

CREATE TABLE `rooms` (
  `id` int PRIMARY KEY,
  `room_id` varchar(32),
  `building_id` int,
  `available` boolean,
  `gender` tinyint,
  `num` tinyint,
  `bad_num` int,
  `free_num` int
);

CREATE TABLE `beds` (
  `id` int PRIMARY KEY,
  `bed_id` tinyint,
  `r_id` int,
  `available` boolean,
  `used` boolean
);

CREATE TABLE `student_bed` (
  `id` int PRIMARY KEY,
  `b_id` int,
  `s_id` int,
  `check` boolean,
  `check_in_year` int,
  `live_years` int
);

CREATE INDEX `students_index_0` ON `students` (`id`);

CREATE INDEX `students_index_1` ON `students` (`student_id`);

CREATE INDEX `entries_index_2` ON `entries` (`s_id`);

CREATE INDEX `rooms_index_3` ON `rooms` (`building_id`);

CREATE INDEX `rooms_index_4` ON `rooms` (`free_num`);

CREATE INDEX `student_bed_index_5` ON `student_bed` (`b_id`);

CREATE INDEX `student_bed_index_6` ON `student_bed` (`s_id`);

ALTER TABLE `students` ADD FOREIGN KEY (`id`) REFERENCES `accounts` (`id`);

ALTER TABLE `admins` ADD FOREIGN KEY (`id`) REFERENCES `accounts` (`id`);

ALTER TABLE `eas` ADD FOREIGN KEY (`id`) REFERENCES `accounts` (`id`);

ALTER TABLE `entries` ADD FOREIGN KEY (`s_id`) REFERENCES `students` (`id`);

ALTER TABLE `entries` ADD FOREIGN KEY (`building_id`) REFERENCES `buildings` (`id`);

ALTER TABLE `rooms` ADD FOREIGN KEY (`building_id`) REFERENCES `buildings` (`id`);

ALTER TABLE `beds` ADD FOREIGN KEY (`r_id`) REFERENCES `rooms` (`id`);

ALTER TABLE `student_bed` ADD FOREIGN KEY (`b_id`) REFERENCES `beds` (`id`);

ALTER TABLE `student_bed` ADD FOREIGN KEY (`s_id`) REFERENCES `students` (`id`);
