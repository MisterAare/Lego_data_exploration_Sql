--- CREATE TABLES TO IMPORT CVS FILES USING MYSQL COMMAND LINE --

-- Importing Files into a Database on MySQL using Command --
-- STEP ONE: Query - show variables like "secure_file_priv" -  in MySQL; --
-- STEP TWO: Copy the CSV file to the above location --
-- STEP THREE: Create tables (See example below) --

CREATE TABLE IF NOT EXISTS `inventories` (
  `id` int4 ,
  `version` int4 DEFAULT NULL,
  `set_num` varchar(20) DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS `inventory_sets` (
  `inventory_id` int4 ,
  `set_num` varchar(20)DEFAULT NULL,
  `quantity` int4 DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS `inventory_minifigs` (
  `inventory_id` int4 ,
  `fig_num` varchar(20) DEFAULT NULL,
  `quantity` int4 DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS `minifigs` (
  `fig_num` varchar(20) ,
  `name` varchar(256) DEFAULT NULL,
  `num_parts` int4 DEFAULT NULL,
   `img_url` VARCHAR(256) DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS `sets` (
  `set_num` varchar(20),
  `name` varchar(300) DEFAULT NULL,
  `year` int4 DEFAULT NULL,
  `theme_id` int4 DEFAULT NULL,
  `num_parts` int4 DEFAULT NULL,
  `img_url` VARCHAR(256) DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS `themes` (
  `id` int4 ,
  `name` varchar(100) DEFAULT NULL,
  `parent_id` int4
);

CREATE TABLE IF NOT EXISTS `inventory_parts` (
  `inventory_id` int4,
  `part_num` varchar(20) DEFAULT NULL,
  `color_id` int4 DEFAULT NULL,
  `quantity` int4 DEFAULT NULL,
  `is_spare` bool DEFAULT NULL,
  `img_url` VARCHAR(256) DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS `colors` (
  `id` int4,
  `name` varchar(200) DEFAULT NULL,
  `rgd` varchar(6) DEFAULT NULL,
  `is_trans` varchar(1) DEFAULT NULL
);

CREATE TABLE `parts` (
  `part_num` varchar(250),
  `name` varchar(250) DEFAULT NULL,
  `part_cat_id` int4 DEFAULT NULL,
  `part_material` varchar(250) DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS `part_categories` (
  `id` int4,
  `name` varchar(350) DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS `elements` (
  `elememts_id` varchar(10) ,
  `part_num` varchar(20) DEFAULT NULL,
  `color_id` int4 DEFAULT NULL,
  `design_id` int4 DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS `part_relationships` (
  `rel_type` varchar(1) ,
  `child_part_num` varchar(20) DEFAULT NULL,
  `parent_part_num` varchar(20) DEFAULT NULL
);


-- STEP FOUR: Load data in file (See below) --
-- Note that the file locations (C:\ProgramData\MySQL\MySQL Server 8.0\\) might varies from the below Load data infile locations --

-- Load Colors Table file -- 
Load data infile '\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\colors.csv'
into table colors
fields terminated by','
lines terminated by '\n'
ignore 1 lines;

-- Load elements Table file --
Load data infile '\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\elements.csv'
into table elements
fields terminated by','
lines terminated by '\n'
ignore 1 lines;

-- Load inventories Table file --
Load data infile '\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\inventories.csv'
into table inventories
fields terminated by','
lines terminated by '\n'
ignore 1 lines;

-- Load inventory_minifigs Table file --
Load data infile '\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\inventory_minifigs.csv'
into table inventory_minifigs
fields terminated by','
lines terminated by '\n'
ignore 1 lines;

-- Load inventory_parts Table file --
-- Because Mysql MySQL does not have a boolean (or bool) data type, i convert the t - 1 and f -0 on the dataset csv file --
Load data infile '\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\inventory_parts.csv'
into table inventory_parts
fields terminated by','
lines terminated by '\n'
ignore 1 lines;

-- Load inventory_sets Table file --
Load data infile '\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\inventory_sets.csv'
into table inventory_sets
fields terminated by','
lines terminated by '\n'
ignore 1 lines;

-- load minifigs Table file --
Load data infile '\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\minifigs.csv'
into table minifigs
fields terminated by','
lines terminated by '\n'
ignore 1 lines;

-- Load part_categories Table file --
Load data infile '\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\part_categories.csv'
into table part_categories
fields terminated by','
lines terminated by '\n'
ignore 1 lines;

-- Load part_relationships Table file --
Load data infile '\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\part_relationships.csv'
into table part_relationships
fields terminated by','
lines terminated by '\n'
ignore 1 lines;


-- laod parts Table file --
Load data infile '\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\parts.csv'
into table parts
fields terminated by','
lines terminated by '\n'
ignore 1 lines;

-- Load sets Table file --
Load data infile '\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\sets.csv'
into table sets
fields terminated by','
lines terminated by '\n'
ignore 1 lines;

Load data infile '\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\themes.csv'
into table themes
fields terminated by','
lines terminated by '\n'
ignore 1 lines;

