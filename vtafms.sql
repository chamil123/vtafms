-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 14, 2017 at 05:12 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `vtafms`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE IF NOT EXISTS `account` (
  `account_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_name` varchar(45) DEFAULT NULL,
  `account_correntBalance` double DEFAULT NULL,
  `account_category_id` int(11) NOT NULL,
  `account_description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`account_id`,`account_category_id`),
  KEY `fk_Account_Account_category1_idx` (`account_category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`account_id`, `account_name`, `account_correntBalance`, `account_category_id`, `account_description`) VALUES
(1, 'Cash and cash equivalents', 25000, 1, '\r\nCategory Type\r\nAccounts receivable (A/R)\r\n*Detail Type\r\nAccounts Receivable (A/R)\r\nAccounts receivable (also called A/R, Debtors, or Trade and other receivables) tracks money that customers owe you '),
(2, 'Travel expenses - distribute packets', 0, 3, 'Use Advertising/promotional to track money spent promoting your company.\r\n\r\nyou may want to different account of this type to track different promotional efforts '),
(4, 'Shop Rental', 0, 3, 'Use Advertising/promotional to track money spent promoting your company.\r\n\r\nyou may want to different account of this type to track different promotional efforts '),
(5, 'Cost of Labour', 0, 3, 'Use Advertising/promotional to track money spent promoting your company.\r\n\r\nyou may want to different account of this type to track different promotional efforts '),
(6, 'Repair and maintenance', 0, 3, 'Use Advertising/promotional to track money spent promoting your company.\r\n\r\nyou may want to different account of this type to track different promotional efforts '),
(7, 'Payroll Expenses', 0, 3, 'Use Advertising/promotional to track money spent promoting your company.\r\n\r\nyou may want to different account of this type to track different promotional efforts '),
(8, 'Office/General Administrative Expenses', 0, 3, 'Use Advertising/promotional to track money spent promoting your company.\r\n\r\nyou may want to different account of this type to track different promotional efforts '),
(9, 'Meals and entertainment', 0, 3, 'Use Advertising/promotional to track money spent promoting your company.\r\n\r\nyou may want to different account of this type to track different promotional efforts '),
(10, 'Betting Slip Payment', 0, 4, 'Use Cost of sales- COS to track the cost of paying bookeys and others'),
(11, 'Paper Cash', 0, 5, 'This account typically has a negative balance so it offsets other income.'),
(12, 'Commision Given', 0, 5, 'This account typically has a negative balance so it offsets other income.'),
(13, 'Commissions and fees', 0, 3, 'Use Commissions and fees to track amounts paid to Bookeys  in order for them to execute a trade.');

-- --------------------------------------------------------

--
-- Table structure for table `accountgeneral`
--

CREATE TABLE IF NOT EXISTS `accountgeneral` (
  `accountGeneral_id` int(11) NOT NULL AUTO_INCREMENT,
  `accountGeneral_date` date DEFAULT NULL,
  `accountGeneral_name` varchar(45) DEFAULT NULL,
  `accountGeneral_noCommisionAmount` double DEFAULT NULL,
  `accountGeneral_lessCommisionAmount` double DEFAULT NULL,
  `accountGeneral_due` double DEFAULT NULL,
  `accountGeneral_pay` double DEFAULT NULL,
  `accountGeneral_lcnc` double DEFAULT NULL,
  `accountGeneral_papercash` double DEFAULT NULL,
  `accountGeneral_compay` double DEFAULT NULL,
  `accountGeneral_expenses` double DEFAULT NULL,
  `AccountGeneral_totalsumpay` double DEFAULT NULL,
  `accountGeneral_loan` double DEFAULT NULL,
  `accountGeneral_excess` double DEFAULT NULL,
  `accountGeneral_status` varchar(45) DEFAULT NULL,
  `agent_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `generalCash_details_id` int(11) NOT NULL,
  PRIMARY KEY (`accountGeneral_id`,`agent_id`,`user_id`,`generalCash_details_id`),
  KEY `fk_AccountGeneral_Account1_idx` (`agent_id`),
  KEY `fk_AccountGeneral_User1_idx` (`user_id`),
  KEY `fk_AccountGeneral_GeneralCash_details1_idx` (`generalCash_details_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `accountgeneral`
--

INSERT INTO `accountgeneral` (`accountGeneral_id`, `accountGeneral_date`, `accountGeneral_name`, `accountGeneral_noCommisionAmount`, `accountGeneral_lessCommisionAmount`, `accountGeneral_due`, `accountGeneral_pay`, `accountGeneral_lcnc`, `accountGeneral_papercash`, `accountGeneral_compay`, `accountGeneral_expenses`, `AccountGeneral_totalsumpay`, `accountGeneral_loan`, `accountGeneral_excess`, `accountGeneral_status`, `agent_id`, `user_id`, `generalCash_details_id`) VALUES
(12, '2016-12-01', 'Awissawella', 0, 0, 7200, 0, 0, 500, 7980, 0, 36520, 0, 0, 'Check', 1, 1, 1),
(13, '2016-12-01', 'Ragama', 0, 0, 6280, 0, 0, 250, 2880, 0, 4490, 0, 0, 'Check', 2, 1, 2),
(14, '2016-12-01', 'Awissawella', 400, 300, 7605, 0, 0, 500, 1800, 0, 1095, 0, 0, 'Check', 1, 1, 1),
(15, '2016-12-02', 'Ragama', 0, 0, 640, 0, 0, 250, 1000, 0, 1510, 0, 0, 'Check', 2, 1, 4),
(16, '2016-12-02', 'Awissawella', 0, 0, 125, 0, 0, 500, 375, 0, 700, 0, 0, 'Check', 1, 1, 3),
(18, '2016-01-10', 'Awissawella', 6500, 4500, 2825, 0, 0, 500, 675, 0, 500, 0, 0, 'Check', 1, 1, 7),
(20, '2016-12-10', 'Mudungoda', 350, 450, 0, 2120, 0, 630, 900, 0, 850, 0, 0, 'Check', 5, 1, 8);

-- --------------------------------------------------------

--
-- Table structure for table `accountgeneral_line`
--

CREATE TABLE IF NOT EXISTS `accountgeneral_line` (
  `accountGeneral_line_id` int(11) NOT NULL AUTO_INCREMENT,
  `accountGeneral_line_summeryName` varchar(45) DEFAULT NULL,
  `accountGeneral_line_fullCollection` double DEFAULT NULL,
  `accountGeneral_line_payment` double DEFAULT NULL,
  `accountGeneral_id` int(11) NOT NULL,
  `summery_id` int(11) NOT NULL,
  PRIMARY KEY (`accountGeneral_line_id`,`accountGeneral_id`,`summery_id`),
  KEY `fk_AccountGeneral_line_AccountGeneral1_idx` (`accountGeneral_id`),
  KEY `fk_AccountGeneral_line_Summery1_idx` (`summery_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `accountgeneral_line`
--

INSERT INTO `accountgeneral_line` (`accountGeneral_line_id`, `accountGeneral_line_summeryName`, `accountGeneral_line_fullCollection`, `accountGeneral_line_payment`, `accountGeneral_id`, `summery_id`) VALUES
(10, 'Dougles', 9800, 490, 13, 106),
(11, 'weligama', 4600, 4000, 13, 105),
(12, 'Thoranagoda', 3500, 945, 14, 107),
(13, 'Kalani', 8500, 150, 14, 108);

-- --------------------------------------------------------

--
-- Table structure for table `account_category`
--

CREATE TABLE IF NOT EXISTS `account_category` (
  `account_category_id` int(11) NOT NULL,
  `account_category_name` varchar(45) DEFAULT NULL,
  `account_category_description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`account_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `account_category`
--

INSERT INTO `account_category` (`account_category_id`, `account_category_name`, `account_category_description`) VALUES
(1, 'Receipt(Revenue-due)', '\r\nCategory Type\r\nAccounts receivable (A/R)\r\n*Detail Type\r\nAccounts Receivable (A/R)\r\nAccounts receivable (also called A/R, Debtors, or Trade and other receivables) tracks money that customers owe you '),
(2, 'Current Assests', 'Use Allowance for bad debts to estimate the part of Accounts Receivable that you think you might not collect.\r\nUse this only if you are keeping your books on the accrual basis.'),
(3, 'Expenses', 'Use Advertising/promotional to track money spent promoting your company.\r\n\r\nyou may want to different account of this type to track different promotional efforts '),
(4, 'Paymet Of slips', 'Use Cost of sales- COS to track the cost of paying bookeys and others'),
(5, 'Income', 'This account typically has a negative balance so it offsets other income.');

-- --------------------------------------------------------

--
-- Table structure for table `agent`
--

CREATE TABLE IF NOT EXISTS `agent` (
  `agent_id` int(11) NOT NULL AUTO_INCREMENT,
  `agent_name` varchar(200) DEFAULT NULL,
  `agent_commision` varchar(45) DEFAULT NULL,
  `agent_noCommision` varchar(45) DEFAULT NULL,
  `agent_lessComission` varchar(45) DEFAULT NULL,
  `agent_availableCenters` int(11) DEFAULT NULL,
  `agent_location` varchar(200) DEFAULT NULL,
  `agent_mobileNumber` varchar(45) DEFAULT NULL,
  `agent_officeNumber` varchar(45) DEFAULT NULL,
  `agent_faxNumber` varchar(45) DEFAULT NULL,
  `agent_email` varchar(45) DEFAULT NULL,
  `agent_paperCash` double DEFAULT NULL,
  PRIMARY KEY (`agent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `agent`
--

INSERT INTO `agent` (`agent_id`, `agent_name`, `agent_commision`, `agent_noCommision`, `agent_lessComission`, `agent_availableCenters`, `agent_location`, `agent_mobileNumber`, `agent_officeNumber`, `agent_faxNumber`, `agent_email`, `agent_paperCash`) VALUES
(1, 'Awissawella', '15', '15', '9', 5, 'awissawella', '0716460440', '0362258260', '0362258260', 'chamiljay88@gmail.com', 500),
(2, 'Ragama', '20', '20', '10', 25, 'Ragama', '0718477601', '0362258580', '0362258580', 'chamiljay88@gmail.com', 250),
(3, 'Kochchikade', '20', '20', '10', 17, 'Kochchikade', '0716460440', '0362258580', '0362258580', 'chamiljay88@gmail.com', 500),
(4, 'Gampaha', '20', '20', '15', 18, 'Colombo', '0716460440', '0452258360', '0452258360', 'chamiljay88@gmail.com', 50),
(5, 'Mudungoda', '20', '20', '15', 6, 'Colombo', '0716460440', '0362258250', '0362258250', 'chamiljay88@gmail.com', 630);

-- --------------------------------------------------------

--
-- Table structure for table `center`
--

CREATE TABLE IF NOT EXISTS `center` (
  `center_id` varchar(45) NOT NULL,
  `center_number` int(11) DEFAULT NULL,
  `center_name` varchar(200) DEFAULT NULL,
  `center_commision` double DEFAULT NULL,
  `center_noCommision` double DEFAULT NULL,
  `center_lessCommision` double DEFAULT NULL,
  `center_paperCash` double DEFAULT NULL,
  `center_moboleNumber` varchar(45) DEFAULT NULL,
  `center_officeNumber` varchar(45) DEFAULT NULL,
  `center_accountType` varchar(45) DEFAULT NULL,
  `center_status` varchar(45) DEFAULT NULL,
  `center_address` varchar(200) DEFAULT NULL,
  `agent_id` int(11) NOT NULL,
  `center_expenses` double DEFAULT NULL,
  PRIMARY KEY (`center_id`,`agent_id`),
  KEY `fk_Center_Account_idx` (`agent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `center`
--

INSERT INTO `center` (`center_id`, `center_number`, `center_name`, `center_commision`, `center_noCommision`, `center_lessCommision`, `center_paperCash`, `center_moboleNumber`, `center_officeNumber`, `center_accountType`, `center_status`, `center_address`, `agent_id`, `center_expenses`) VALUES
('Aw1119184741', 1119184741, 'Marambe', 14, 14, 9, 75, '0716460440', '0362258250', 'Normal', 'Activate', 'Dandeniya road\r\nDandeniya', 1, 350),
('Aw1119185138', 1119185138, 'Ashvaya', 14, 14, 9, 35, '0717921765', '0362258250', 'Normal', 'Activate', 'Oluwila Junction\r\nManiyangama', 1, 400),
('Aw112345033', 112345033, 'Aruna', 14, 14, 9, 350, '0716460440', '0362258260', 'Normal', 'Activate', 'Oluwila Junction\r\nManiyangama', 1, 430),
('Aw1127221525', 1127221525, 'Amithitigala', 13, 13, 12, 10, '0721254871', '0362230585', 'Normal', 'Deactivate', 'Dandeniya road\r\nDandeniya', 1, 500),
('Aw1130195316', 1130195316, 'Thoranagoda', 14, 14, 9, 350, '0716564085', '0362258480', 'General', 'Activate', 'Kosgashandiya, Dandeniya, Opanayake', 1, 350),
('Aw1130195624', 1130195624, 'Kalani', 14, 14, 9, 630, '0711116055', '0362258360', 'General', 'Activate', 'Mahahen watta, dandeniya, Eheliyagoda', 1, 460),
('Aw1210103355', 1210103355, 'kamal', 14, 14, 9, 25, '0716460440', '0362258250', 'General', 'Deactivate', 'Dandeniya road\r\nDandeniya', 1, 40),
('Ga1104616', 1104616, 'Janaka', 15, 15, 9, 360, '0716460440', '0362258250', 'General', 'Activate', 'Dandeniya road\r\nDandeniya', 4, 15),
('Mu110476', 110476, 'New star', 15, 15, 9, 350, '0716460440', '0362258250', 'General', 'Activate', 'Dandeniya road\r\nDandeniya', 5, 350),
('Ra12104022', 12104022, 'Dougles', 14, 14, 9, 450, '0716460440', '0362258260', 'General', 'Activate', 'Oluwila Junction\r\nManiyangama', 2, 350),
('Ra121223415', 121223415, 'weligama', 12, 15, 12, 10, '0112365478', '0112548871', 'General', 'Activate', '12,fghfgh,jgjg.', 2, 200);

-- --------------------------------------------------------

--
-- Table structure for table `centercash_details`
--

CREATE TABLE IF NOT EXISTS `centercash_details` (
  `centerCash_details_id` int(11) NOT NULL AUTO_INCREMENT,
  `centerCash_details_FullCollection` double DEFAULT NULL,
  `centerCash_details_cash` double DEFAULT NULL,
  `centerCash_details_date` date DEFAULT NULL,
  `centerCash_details_passDue` double DEFAULT NULL,
  `center_id` varchar(45) NOT NULL,
  `account_id` int(11) NOT NULL,
  PRIMARY KEY (`centerCash_details_id`,`center_id`,`account_id`),
  KEY `fk_FullCollection_Center1_idx` (`center_id`),
  KEY `fk_CenterCash_details_Account1_idx` (`account_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=154 ;

--
-- Dumping data for table `centercash_details`
--

INSERT INTO `centercash_details` (`centerCash_details_id`, `centerCash_details_FullCollection`, `centerCash_details_cash`, `centerCash_details_date`, `centerCash_details_passDue`, `center_id`, `account_id`) VALUES
(114, 7500, 4500, '2016-12-10', 300, 'Aw1119184741', 1),
(115, 6800, 4500, '2016-12-01', 500, 'Aw1119185138', 1),
(116, 4600, 9000, '2016-12-01', 1200, 'Ra121223415', 2),
(117, 9800, 6600, '2016-12-01', 3500, 'Ra12104022', 2),
(118, 3500, 4900, '2016-12-01', 600, 'Aw1130195316', 1),
(119, 8500, 5800, '2016-12-01', 850, 'Aw1130195624', 1),
(120, 2500, 2000, '2016-12-02', 120, 'Aw1130195624', 1),
(121, 10000, 4000, '2016-12-02', 250, 'Ra121223415', 2),
(122, 4500, 1500, '2016-12-07', 1500, 'Aw1119184741', 1),
(123, 4500, 3503, '2016-12-07', 1360, 'Aw1119185138', 1),
(124, 6400, 5325, '2016-12-07', 2300, 'Aw112345033', 1),
(125, 4440, 3650, '2016-12-07', 450, 'Aw1130195316', 1),
(126, 8500, 4800, '2016-12-07', 3500, 'Aw1130195624', 1),
(127, 6500, 4500, '2016-12-09', 500, 'Aw1119184741', 1),
(128, 7500, 6500, '2016-12-10', 4500, 'Aw1119184741', 1),
(129, 3500, 5000, '2016-01-10', 150, 'Aw1119184741', 1),
(130, 6500, 4500, '2016-01-10', 5000, 'Aw1119185138', 1),
(131, 3500, 4500, '2016-01-10', 2500, 'Aw112345033', 1),
(132, 5600, 4500, '2016-01-10', 3500, 'Ra121223415', 2),
(133, 6600, 4400, '2016-01-10', 500, 'Ga1104616', 4),
(134, 7700, 6600, '2016-01-10', 1500, 'Mu110476', 5),
(135, 5500, 6500, '2016-12-10', 500, 'Aw1130195624', 1),
(139, 6500, 4500, '2016-12-10', 260, 'Aw1119184741', 1),
(140, 4500, 4000, '2016-12-10', 150, 'Aw1119184741', 1),
(141, 6000, 5000, '2016-12-10', 1000, 'Aw1119185138', 1),
(142, 6500, 450, '2016-02-10', 500, 'Aw1119185138', 1),
(143, 6500, 4500, '2016-12-11', 50, 'Aw1119184741', 1),
(144, 4500, 3500, '2016-12-15', 500, 'Aw1119185138', 1),
(145, 7500, 6500, '2016-12-15', 500, 'Aw112345033', 1),
(146, 4500, 3500, '2016-03-08', 25, 'Aw1119184741', 1),
(147, 3500, 4000, '2016-03-08', 600, 'Aw1119185138', 1),
(148, 9500, 8600, '2016-03-08', 6000, 'Aw112345033', 1),
(149, 6500, 4800, '2016-04-08', 606, 'Aw1119184741', 1),
(150, 7500, 6800, '2016-04-08', 560, 'Aw1119185138', 1),
(151, 4500, 3500, '2016-04-08', 500, 'Ra121223415', 2),
(152, 5000, 4500, '2016-05-08', 3000, 'Mu110476', 5),
(153, 4500, 6000, '2017-01-24', 500, 'Aw1119184741', 1);

-- --------------------------------------------------------

--
-- Table structure for table `center_expenses`
--

CREATE TABLE IF NOT EXISTS `center_expenses` (
  `center_expenses_id` int(11) NOT NULL AUTO_INCREMENT,
  `center_expenses_expenseName` varchar(1000) DEFAULT NULL,
  `center_expenses_amount` double DEFAULT NULL,
  `center_id` varchar(45) NOT NULL,
  PRIMARY KEY (`center_expenses_id`,`center_id`),
  KEY `fk_Center_expenses_Center1_idx` (`center_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

--
-- Dumping data for table `center_expenses`
--

INSERT INTO `center_expenses` (`center_expenses_id`, `center_expenses_expenseName`, `center_expenses_amount`, `center_id`) VALUES
(13, 'Travel expenses - distribute packets', 350, 'Aw1119184741'),
(14, 'Travel expenses - distribute packets', 400, 'Aw1119185138'),
(15, 'Cash and cash equivalents', 30, 'Aw112345033'),
(16, 'Shop Rental', 400, 'Aw112345033'),
(17, 'Travel expenses - distribute packets', 500, 'Aw1127221525'),
(18, 'Travel expenses - distribute packets', 350, 'Aw1130195316'),
(19, 'Travel expenses - distribute packets', 360, 'Aw1130195624'),
(20, 'Shop Rental', 100, 'Aw1130195624'),
(21, 'Travel expenses - distribute packets', 200, 'Ra121223415'),
(22, 'Travel expenses - distribute packets', 350, 'Ra12104022'),
(23, 'Cash and cash equivalents', 15, 'Ga1104616'),
(24, 'Travel expenses - distribute packets', 350, 'Mu110476'),
(25, 'Travel expenses - distribute packets', 40, 'Aw1210103355');

-- --------------------------------------------------------

--
-- Table structure for table `collection_timebag`
--

CREATE TABLE IF NOT EXISTS `collection_timebag` (
  `collection_timeBag_id` int(11) NOT NULL AUTO_INCREMENT,
  `Collection_timeBag_date` date DEFAULT NULL,
  `runner_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `agent_id` int(11) NOT NULL,
  PRIMARY KEY (`collection_timeBag_id`,`runner_id`,`user_id`,`agent_id`),
  KEY `fk_Collection_timeBag_Runner1_idx` (`runner_id`),
  KEY `fk_Collection_timeBag_User1_idx` (`user_id`),
  KEY `fk_Collection_timeBag_Agent1_idx` (`agent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `collection_timebag`
--

INSERT INTO `collection_timebag` (`collection_timeBag_id`, `Collection_timeBag_date`, `runner_id`, `user_id`, `agent_id`) VALUES
(1, '2016-12-10', 1, 1, 1),
(2, '2016-12-10', 1, 1, 1),
(3, '2016-12-10', 42, 1, 1),
(4, '2016-12-10', 42, 1, 1),
(5, '2016-12-10', 44, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `collection_timebag_line`
--

CREATE TABLE IF NOT EXISTS `collection_timebag_line` (
  `collection_timeBag_line_id` int(11) NOT NULL AUTO_INCREMENT,
  `collection_timeBag_line_timeValue` varchar(45) DEFAULT NULL,
  `collection_timeBag_line_OpenTime` varchar(45) DEFAULT NULL,
  `collection_timeBag_line_closeTime` varchar(45) DEFAULT NULL,
  `collection_timeBag_id` int(11) NOT NULL,
  `time_bag_Code` varchar(45) NOT NULL,
  `collection_timeBag_line_rateAmount` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`collection_timeBag_line_id`,`collection_timeBag_id`,`time_bag_Code`),
  KEY `fk_Collection_timeBag_line_Collection_timeBag1_idx` (`collection_timeBag_id`),
  KEY `fk_Collection_timeBag_line_Time_bag1_idx` (`time_bag_Code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `collection_timebag_line`
--

INSERT INTO `collection_timebag_line` (`collection_timeBag_line_id`, `collection_timeBag_line_timeValue`, `collection_timeBag_line_OpenTime`, `collection_timeBag_line_closeTime`, `collection_timeBag_id`, `time_bag_Code`, `collection_timeBag_line_rateAmount`) VALUES
(1, '2.15', '10:30:05', '8:14', 1, '001', '150'),
(2, '2.10', '10:30:31', '8:20', 1, '003', '250'),
(3, '2.05', '11:51:23', '9:46', 2, '003', '2500'),
(4, '2.01', '12:35:39', '10:34', 3, '002', '300'),
(5, '1.0', '12:50:18', '11:50', 4, '002', '250'),
(6, '1.02', '13:16:48', '12:14', 5, '003', '25000');

-- --------------------------------------------------------

--
-- Table structure for table `excess`
--

CREATE TABLE IF NOT EXISTS `excess` (
  `excess_id` int(11) NOT NULL AUTO_INCREMENT,
  `center_id` varchar(45) NOT NULL,
  `excess_date` date DEFAULT NULL,
  `excess_total` double DEFAULT NULL,
  PRIMARY KEY (`excess_id`,`center_id`),
  KEY `fk_Excess_Center1_idx` (`center_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `excess`
--

INSERT INTO `excess` (`excess_id`, `center_id`, `excess_date`, `excess_total`) VALUES
(16, 'Aw1119184741', '2016-12-01', 70),
(17, 'Aw1119184741', '2016-12-09', 110);

-- --------------------------------------------------------

--
-- Table structure for table `excess_line`
--

CREATE TABLE IF NOT EXISTS `excess_line` (
  `excess_line_id` int(11) NOT NULL AUTO_INCREMENT,
  `excess_id` int(11) NOT NULL,
  `excess_line_chitNumber` varchar(45) DEFAULT NULL,
  `excess_line_repeatCount` int(11) DEFAULT NULL,
  `excess_line_totalPayment` double DEFAULT NULL,
  `excess_line_duePayment` double DEFAULT NULL,
  `excess_line_reason` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`excess_line_id`,`excess_id`),
  KEY `fk_Excess_line_Excess1_idx` (`excess_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=114 ;

--
-- Dumping data for table `excess_line`
--

INSERT INTO `excess_line` (`excess_line_id`, `excess_id`, `excess_line_chitNumber`, `excess_line_repeatCount`, `excess_line_totalPayment`, `excess_line_duePayment`, `excess_line_reason`) VALUES
(109, 16, '25', 45, 400, 25, 'sdsadas'),
(110, 16, 'a35', 2, 50, 45, 'dfsdfsdfsd'),
(112, 17, '20', 1, 2500, 100, 'sddad'),
(113, 17, '1', 2, 150, 10, 'dasdad');

-- --------------------------------------------------------

--
-- Table structure for table `expences`
--

CREATE TABLE IF NOT EXISTS `expences` (
  `expences_id` int(11) NOT NULL AUTO_INCREMENT,
  `expences_name` varchar(200) DEFAULT NULL,
  `expences_amount` double DEFAULT NULL,
  `expences_remark` varchar(200) DEFAULT NULL,
  `expences_type` varchar(45) DEFAULT NULL,
  `expences_addDate` date DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  PRIMARY KEY (`expences_id`,`account_id`),
  KEY `fk_Expences_Account1_idx` (`account_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `expences`
--

INSERT INTO `expences` (`expences_id`, `expences_name`, `expences_amount`, `expences_remark`, `expences_type`, `expences_addDate`, `account_id`) VALUES
(1, 'Traveling', 250, 'dsadasd', 'active', '2016-09-05', 0);

-- --------------------------------------------------------

--
-- Table structure for table `generalcash_details`
--

CREATE TABLE IF NOT EXISTS `generalcash_details` (
  `generalCash_details_id` int(11) NOT NULL AUTO_INCREMENT,
  `generalCash_details_cash` double DEFAULT NULL,
  `generalCash_details_passDue` double DEFAULT NULL,
  `generalCash_details_date` date DEFAULT NULL,
  `agent_id` int(11) NOT NULL,
  PRIMARY KEY (`generalCash_details_id`,`agent_id`),
  KEY `fk_GeneralCash_details_Account1_idx` (`agent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `generalcash_details`
--

INSERT INTO `generalcash_details` (`generalCash_details_id`, `generalCash_details_cash`, `generalCash_details_passDue`, `generalCash_details_date`, `agent_id`) VALUES
(1, 6500, 4500, '2016-12-01', 1),
(2, 5800, 4800, '2016-12-01', 2),
(3, 6600, 4800, '2016-12-02', 1),
(4, 9900, 7800, '2016-12-02', 2),
(5, 444, 7777, '2016-12-10', 1),
(6, 8000, 6000, '2016-01-10', 4),
(7, 4500, 3500, '2016-01-10', 1),
(8, 6000, 500, '2016-12-10', 5);

-- --------------------------------------------------------

--
-- Table structure for table `loan`
--

CREATE TABLE IF NOT EXISTS `loan` (
  `loan_id` int(11) NOT NULL AUTO_INCREMENT,
  `loan_amount` double DEFAULT NULL,
  `loan_dateRelease` date DEFAULT NULL,
  `loan_status` varchar(45) DEFAULT NULL,
  `loan_remark` varchar(45) DEFAULT NULL,
  `loan_scheduleOfPayment` varchar(45) DEFAULT NULL,
  `loan_interestRate` varchar(45) DEFAULT NULL,
  `center_id` varchar(45) NOT NULL,
  `user_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `loan_balance` double DEFAULT NULL,
  PRIMARY KEY (`loan_id`,`center_id`,`user_id`,`account_id`),
  KEY `fk_Loan_Center1_idx` (`center_id`),
  KEY `fk_Loan_User1_idx` (`user_id`),
  KEY `fk_Loan_Account1_idx` (`account_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `loan`
--

INSERT INTO `loan` (`loan_id`, `loan_amount`, `loan_dateRelease`, `loan_status`, `loan_remark`, `loan_scheduleOfPayment`, `loan_interestRate`, `center_id`, `user_id`, `account_id`, `loan_balance`) VALUES
(12, 8000, '2016-11-19', 'Pending', 'dfdsfsdfsd', '200', '0.0', 'Aw1119184741', 1, 1, 4000),
(13, 4000, '2016-11-27', 'Pending', 'sedesaasasasdasdasda asd asd asd as', '40', '0.0', 'Aw112345033', 1, 1, 3880),
(14, 800, '2016-11-28', 'Pending', 'sdasasdas', '200', '0.0', 'Aw1119185138', 1, 1, 0),
(16, 8000, '2016-11-28', 'Pending', 'fffffffffff', '200', '0.0', 'Aw112345033', 1, 1, 7400),
(17, 7500, '2016-11-29', 'Pending', 'fsasdasdasd', '300', '0.0', 'Aw1119185138', 1, 1, 4800),
(18, 300, '2016-11-15', 'Pending', 'asdasas', '100', '0.0', 'Aw1119184741', 1, 1, 0),
(19, 350, '2016-11-16', 'Completed', 'dfsadsdsad', '100', '0.0', 'Aw1119185138', 1, 1, 0),
(20, 800, '2016-11-12', 'Completed', 'oisadas a asasd', '300', '0.0', 'Aw112345033', 1, 1, 0),
(21, 600, '2016-11-05', 'Completed', 'sdas asd as a', '45', '0.0', 'Aw1119184741', 1, 1, 0),
(23, 3000, '2016-11-17', 'Pending', 'dsas asd ', '200', '0.0', 'Aw112345033', 1, 1, 2400);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `login_username` varchar(45) DEFAULT NULL,
  `login_password` varchar(45) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`login_username`, `login_password`, `user_id`) VALUES
('admin', 'admin', 1),
('rasika', '6460440', 14),
('nishan', '123', 16),
('shiva', '123', 18),
('sumida', '123', 19),
('niro', '123', 20),
('imal', '123', 21),
('sunil', '123', 22),
('charu', '123', 23),
('mervyn', '123', 24),
('nisa', '123', 25);

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE IF NOT EXISTS `notification` (
  `notification_id` int(11) NOT NULL AUTO_INCREMENT,
  `notification_Own` varchar(45) DEFAULT NULL,
  `notificationDescription` varchar(500) DEFAULT NULL,
  `notification_status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`notification_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`notification_id`, `notification_Own`, `notificationDescription`, `notification_status`) VALUES
(1, 'Bulugaha', 'complete deduction loan in Bulugaha date of 2016-11-03 ', 'Completed'),
(2, 'Bulugaha', 'complete deduction loan in Bulugaha date of 2016-11-03 ', 'Completed'),
(3, 'Bulugaha', 'complete deduction loan in Bulugaha date of 2016-11-03 ', 'Active'),
(4, 'Bulugaha', 'complete deduction loan in Bulugaha date of 2016-11-03 ', 'Active'),
(5, 'Bulugaha', 'complete deduction loan in Bulugaha date of 2016-11-03 ', 'Active'),
(6, '71', 'Marambe', 'Active'),
(7, 'Marambe', 'asdasdasd', 'Active'),
(8, 'Ashvaya', 'Cash is wrong', 'Active'),
(9, 'Aruna', 'cash invalid', 'Active'),
(10, 'Ashvaya', 'excess shoud be 35', 'Active'),
(11, 'Aruna', 'incorrect cash', 'Active'),
(12, 'Aruna', 'incorrect cash', 'Active'),
(13, 'Aruna', 'asdasd', 'Active'),
(14, 'Marambe', 'asasa', 'Active'),
(15, 'Aruna', 'wrong cash', 'Active'),
(16, 'Ashvaya', 'complete deduction loan in Ashvaya date of 2016-11-16 ', 'Active'),
(17, 'weligama', 'chk cash', 'Active'),
(18, 'Kalani', 'full clleff', 'Active'),
(19, 'Dougles', 'njkj', 'Active'),
(20, 'Aruna', 'complete deduction loan in Aruna date of 2016-11-12 ', 'Active'),
(21, 'Marambe', 'complete deduction loan in Marambe date of 2016-11-05 ', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE IF NOT EXISTS `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`role_id`, `role_name`) VALUES
(1, 'Admin'),
(2, 'Manager'),
(3, 'Summery Manager'),
(4, 'Excess Manager'),
(5, 'System User');

-- --------------------------------------------------------

--
-- Table structure for table `runner`
--

CREATE TABLE IF NOT EXISTS `runner` (
  `runner_id` int(11) NOT NULL AUTO_INCREMENT,
  `runner_firstName` varchar(200) DEFAULT NULL,
  `runner_lastName` varchar(200) DEFAULT NULL,
  `runner_NIC` varchar(45) DEFAULT NULL,
  `runner_mobileNumber` varchar(45) DEFAULT NULL,
  `runner_homeNumber` varchar(45) DEFAULT NULL,
  `runner_email` varchar(45) DEFAULT NULL,
  `runner_address` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`runner_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=45 ;

--
-- Dumping data for table `runner`
--

INSERT INTO `runner` (`runner_id`, `runner_firstName`, `runner_lastName`, `runner_NIC`, `runner_mobileNumber`, `runner_homeNumber`, `runner_email`, `runner_address`) VALUES
(1, 'Praveen sas', 'Pushpika new', '882073428V', '0362258580', '0362258480', 'chamiljay88@gmail.com', 'Oluwila Junction\r\nManiyangama'),
(42, 'gamindaa', 'pathirana', '852073428V', '0716895176', '0362258480', 'chameerakulasekara@gmail.com', 'Dandeniya road\r\nDandeniya'),
(44, 'chamil', 'patirana', '862073428V', '0716460440', '0362258480', 'chameerakulasekara@gmail.com', 'Oluwila Junction\r\nManiyangama');

-- --------------------------------------------------------

--
-- Table structure for table `summery`
--

CREATE TABLE IF NOT EXISTS `summery` (
  `summery_id` int(11) NOT NULL AUTO_INCREMENT,
  `summery_date` date DEFAULT NULL,
  `summery_name` varchar(45) DEFAULT NULL,
  `summery_noCommisionAmount` double DEFAULT NULL,
  `summery_lessCommisionAmount` double DEFAULT NULL,
  `summery_due` double DEFAULT NULL,
  `summery_pay` double DEFAULT NULL,
  `summery_lcnc` double DEFAULT NULL,
  `summery_papercash` double DEFAULT NULL,
  `Summery_compay` double DEFAULT NULL,
  `Summery_expences` double DEFAULT NULL,
  `center_id` varchar(45) NOT NULL,
  `user_id` int(11) NOT NULL,
  `centerCash_details_id` int(11) NOT NULL,
  `Summer_slippaytot` double DEFAULT NULL,
  `summery_loan` double DEFAULT NULL,
  `summery_excess` double DEFAULT NULL,
  `summery_status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`summery_id`,`center_id`,`user_id`,`centerCash_details_id`),
  KEY `fk_Summery_User1_idx` (`user_id`),
  KEY `fk_Summery_CenterCash_details1_idx` (`centerCash_details_id`),
  KEY `fk_Summery_Center1_idx` (`center_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=136 ;

--
-- Dumping data for table `summery`
--

INSERT INTO `summery` (`summery_id`, `summery_date`, `summery_name`, `summery_noCommisionAmount`, `summery_lessCommisionAmount`, `summery_due`, `summery_pay`, `summery_lcnc`, `summery_papercash`, `Summery_compay`, `Summery_expences`, `center_id`, `user_id`, `centerCash_details_id`, `Summer_slippaytot`, `summery_loan`, `summery_excess`, `summery_status`) VALUES
(103, '2016-12-01', 'Marambe', 0, 0, 0, 3590, 0, 75, 910, 350, 'Aw1119184741', 1, 114, 4950, 245, 0, 'Check'),
(104, '2016-12-01', 'Ashvaya', 3500, 500, 0, 1612, 535, 35, 952, 400, 'Aw1119185138', 1, 115, 4180, 550, 0, 'Check'),
(105, '2016-12-01', 'weligama', 3500, 500, 0, 7407, 535, 10, 552, 200, 'Ra121223415', 1, 116, 4000, 0, 0, 'Check'),
(106, '2016-12-01', 'Dougles', 3500, 4500, 5833, 0, 895, 450, 1372, 350, 'Ra12104022', 1, 117, 490, 0, 0, 'Uncheck'),
(107, '2016-12-01', 'Thoranagoda', 4500, 300, 0, 1578, 657, 350, 490, 350, 'Aw1130195316', 1, 118, 945, 0, 0, 'Check'),
(108, '2016-12-01', 'Kalani', 4500, 300, 3037, 0, 657, 630, 1190, 460, 'Aw1130195624', 1, 119, 150, 0, 0, 'Check'),
(109, '2016-12-02', 'Kalani', 300, 100, 0, 209, 51, 630, 350, 460, 'Aw1130195624', 1, 120, 700, 0, 0, 'Uncheck'),
(110, '2016-12-02', 'weligama', 400, 500, 0, 930, 120, 10, 600, 200, 'Ra121223415', 1, 121, 1510, 0, 0, 'Uncheck'),
(111, '2016-12-07', 'Marambe', 6500, 450, 3445.5, 0, 950.5, 75, 630, 350, 'Aw1119184741', 1, 122, 1345, 245, 0, 'Check'),
(112, '2016-12-07', 'Ashvaya', 350, 450, 1210.5, 0, 89.5, 35, 630, 400, 'Aw1119185138', 1, 123, 541, 300, 0, 'Check'),
(113, '2016-12-07', 'Aruna', 350, 250, 3175.5, 0, 71.5, 350, 896, 430, 'Aw112345033', 1, 124, 35, 740, 0, 'Check'),
(114, '2016-12-07', 'Thoranagoda', 0, 0, 0, 709.6000000000004, 0, 350, 621.6, 350, 'Aw1130195316', 1, 125, 1328, 0, 0, 'Check'),
(115, '2016-12-07', 'Kalani', 350, 550, 5290.5, 0, 98.5, 630, 1190, 460, 'Aw1130195624', 1, 126, 988, 0, 0, 'Check'),
(116, '2016-12-09', 'Marambe', 500, 350, 1551.5, 0, 101.5, 75, 910, 350, 'Aw1119184741', 1, 127, 110, 245, 0, 'Check'),
(118, '2016-01-10', 'Marambe', 5000, 3500, 0, 6455, 1015, 75, 490, 350, 'Aw1119184741', 1, 129, 5600, 245, 0, 'Check'),
(119, '2016-01-10', 'Ashvaya', 350, 3500, 1649, 0, 364, 35, 910, 400, 'Aw1119185138', 1, 130, 4740, 300, 0, 'Check'),
(120, '2016-01-10', 'Janaka', 3500, 450, 2095.5, 0, 565.5, 360, 990, 15, 'Ga1104616', 1, 133, 525, 0, 0, 'Check'),
(121, '2016-01-10', 'New star', 3500, 1100, 1529, 0, 624, 350, 1155, 350, 'Mu110476', 1, 134, 540, 0, 0, 'Check'),
(122, '2016-01-10', 'Kalani', 4500, 3500, 0, 1515, 945, 630, 630, 460, 'Aw1130195624', 1, 135, 500, 0, 0, 'Check'),
(126, '2016-12-10', 'Marambe', 4540, 3000, 5435.6, 0, 905.6, 75, 910, 350, 'Aw1119184741', 1, 128, 30, 245, 0, 'Check'),
(127, '2016-12-10', 'Ashvaya', 3000, 500, 0, 1455, 465, 35, 840, 400, 'Aw1119185138', 1, 141, 3015, 300, 0, 'Check'),
(128, '2016-02-10', 'Ashvaya', 40, 350, 5557.1, 0, 37.1, 35, 910, 400, 'Aw1119185138', 1, 142, 55, 300, 0, 'Check'),
(129, '2016-12-11', 'Marambe', 500, 600, 1130, 0, 124, 75, 910, 350, 'Aw1119184741', 1, 143, 104, 245, 0, 'Check'),
(130, '2016-12-15', 'Aruna', 300, 500, 642, 0, 87, 350, 1050, 430, 'Aw112345033', 1, 145, 455, 640, 0, 'Check'),
(131, '2016-03-08', 'Marambe', 4500, 3500, 0, 13690, 945, 75, 630, 350, 'Aw1119184741', 1, 146, 15000, 245, 0, 'Check'),
(132, '2016-03-08', 'Ashvaya', 6000, 4500, 0, 14860, 1245, 35, 490, 400, 'Aw1119185138', 1, 147, 15650, 300, 0, 'Check'),
(133, '2016-04-08', 'Marambe', 890, 450, 0, 7668.9, 165.1, 75, 910, 350, 'Aw1119184741', 1, 149, 9200, 245, 0, 'Check'),
(134, '2016-05-08', 'New star', 4500, 6500, 0, 25990, 1260, 350, 750, 350, 'Mu110476', 1, 152, 30000, 0, 0, 'Check'),
(135, '2017-01-24', 'Marambe', 3000, 5000, 0, 2830, 870, 75, 630, 350, 'Aw1119184741', 1, 153, 2010, 215, 0, 'Check');

-- --------------------------------------------------------

--
-- Table structure for table `summery_line`
--

CREATE TABLE IF NOT EXISTS `summery_line` (
  `summery_line_id` int(11) NOT NULL AUTO_INCREMENT,
  `summery_id` int(11) NOT NULL,
  `summery_line_chitNumber` varchar(45) DEFAULT NULL,
  `Summery_line_Investment` double DEFAULT NULL,
  `Summery_line_payment` double DEFAULT NULL,
  `Summery_lin_date` date DEFAULT NULL,
  PRIMARY KEY (`summery_line_id`,`summery_id`),
  KEY `fk_Summery_line_Summery1_idx` (`summery_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=303 ;

--
-- Dumping data for table `summery_line`
--

INSERT INTO `summery_line` (`summery_line_id`, `summery_id`, `summery_line_chitNumber`, `Summery_line_Investment`, `Summery_line_payment`, `Summery_lin_date`) VALUES
(215, 103, '400', 350, 450, '2016-12-01'),
(216, 103, '3', 500, 4500, '2016-12-01'),
(217, 104, '45', 250, 3500, '2016-12-01'),
(218, 104, '3', 25, 680, '2016-12-01'),
(219, 105, '450', 350, 500, '2016-12-01'),
(220, 105, '500', 45, 3500, '2016-12-01'),
(221, 106, '20', 30, 10, '2016-12-01'),
(222, 106, '8', 680, 480, '2016-12-01'),
(223, 107, '20', 30, 45, '2016-12-01'),
(224, 107, '3', 48, 900, '2016-12-01'),
(225, 108, '500', 30, 120, '2016-12-01'),
(226, 108, '45', 80, 30, '2016-12-01'),
(227, 109, '125', 25, 200, '2016-12-02'),
(228, 109, '251', 200, 500, '2016-12-02'),
(229, 110, '251', 410, 510, '2016-12-02'),
(230, 110, '41', 500, 1000, '2016-12-02'),
(231, 111, '2', 15, 350, '2016-12-07'),
(232, 111, '3', 25, 400, '2016-12-07'),
(233, 111, '3', 15, 20, '2016-12-07'),
(234, 111, '3', 15, 45, '2016-12-07'),
(235, 111, '9', 15, 35, '2016-12-07'),
(236, 111, '7', 58, 45, '2016-12-07'),
(237, 111, '11', 2, 450, '2016-12-07'),
(238, 112, '41', 455, 50, '2016-12-07'),
(239, 112, '3', 25, 450, '2016-12-07'),
(240, 112, '3', 15, 20, '2016-12-07'),
(241, 112, '6', 35, 14, '2016-12-07'),
(242, 112, '9', 25, 7, '2016-12-07'),
(243, 113, '25', 15, 15, '2016-12-07'),
(244, 113, '3', 15, 20, '2016-12-07'),
(245, 114, '150', 2, 30, '2016-12-07'),
(246, 114, '3', 25, 45, '2016-12-07'),
(247, 114, '9', 2, 350, '2016-12-07'),
(248, 114, '1', 3, 45, '2016-12-07'),
(249, 114, '8', 25, 323, '2016-12-07'),
(250, 114, '33', 25, 45, '2016-12-07'),
(251, 114, '12', 35, 445, '2016-12-07'),
(252, 114, '2', 8, 4, '2016-12-07'),
(253, 114, '63', 25, 41, '2016-12-07'),
(254, 115, '2', 35, 15, '2016-12-07'),
(255, 115, '1', 25, 45, '2016-12-07'),
(256, 115, '9', 25, 65, '2016-12-07'),
(257, 115, '7', 85, 35, '2016-12-07'),
(258, 115, '55', 35, 155, '2016-12-07'),
(259, 115, '3', 25, 450, '2016-12-07'),
(260, 115, '11', 254, 223, '2016-12-07'),
(261, 116, '20', 30, 10, '2016-12-09'),
(262, 116, '3', 20, 40, '2016-12-09'),
(263, 116, '3', 15, 60, '2016-12-09'),
(266, 118, '3', 25, 450, '2016-01-10'),
(267, 118, '3', 150, 4500, '2016-01-10'),
(268, 118, '3', 25, 650, '2016-01-10'),
(269, 119, '3', 25, 4500, '2016-01-10'),
(270, 119, '3', 25, 240, '2016-01-10'),
(271, 120, '2', 3, 45, '2016-01-10'),
(272, 120, '20', 30, 480, '2016-01-10'),
(273, 121, '3', 25, 450, '2016-01-10'),
(274, 121, '3', 58, 90, '2016-01-10'),
(275, 122, '2', 3, 50, '2016-01-10'),
(276, 122, '3', 25, 450, '2016-01-10'),
(284, 126, '5', 30, 10, '2016-12-10'),
(285, 126, '6', 40, 20, '2016-12-10'),
(286, 127, '2', 25, 15, '2016-12-10'),
(287, 127, '3', 25, 400, '2016-12-10'),
(288, 127, '2', 150, 2600, '2016-12-10'),
(289, 128, '2', 35, 15, '2016-02-10'),
(290, 128, '3', 25, 40, '2016-02-10'),
(291, 129, '52', 5, 15, '2016-12-11'),
(292, 129, '3', 25, 44, '2016-12-11'),
(293, 129, '3', 25, 45, '2016-12-11'),
(294, 130, '10', 20, 3, '2016-12-15'),
(295, 130, '35', 20, 452, '2016-12-15'),
(296, 131, '20', 30, 15000, '2016-03-08'),
(297, 132, '200', 300, 15650, '2016-03-08'),
(298, 133, '2', 35, 6000, '2016-04-08'),
(299, 133, '2', 56, 3200, '2016-04-08'),
(300, 134, '30', 50, 30000, '2016-05-08'),
(301, 135, '20', 30, 10, '2017-01-24'),
(302, 135, '30', 45, 2000, '2017-01-24');

-- --------------------------------------------------------

--
-- Table structure for table `time_bag`
--

CREATE TABLE IF NOT EXISTS `time_bag` (
  `time_bag_Code` varchar(45) NOT NULL,
  `Time_bag_type` varchar(45) DEFAULT NULL,
  `Time_bag_availableCenters` int(11) DEFAULT NULL,
  `runner_id` int(11) NOT NULL,
  PRIMARY KEY (`time_bag_Code`,`runner_id`),
  KEY `fk_Time_bag_Runner1_idx` (`runner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `time_bag`
--

INSERT INTO `time_bag` (`time_bag_Code`, `Time_bag_type`, `Time_bag_availableCenters`, `runner_id`) VALUES
('001', 'single', 5, 1),
('002', 'single', 6, 1),
('003', 'double', 8, 1);

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE IF NOT EXISTS `transaction` (
  `transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_date` date DEFAULT NULL,
  `transaction_payee` varchar(45) DEFAULT NULL,
  `transaction_amount` double DEFAULT NULL,
  `transaction_type` varchar(45) DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  PRIMARY KEY (`transaction_id`,`account_id`),
  KEY `fk_Transaction_Account1_idx` (`account_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=336 ;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`transaction_id`, `transaction_date`, `transaction_payee`, `transaction_amount`, `transaction_type`, `account_id`) VALUES
(167, '2016-11-19', 'Aw1119184741', 2500, 'Collet cash', 1),
(168, '2016-11-19', 'Aw1119185138', 3900, 'Collet cash', 1),
(169, '2016-11-19', 'Marambe', 350, 'bookey expenses', 2),
(170, '2016-11-21', 'Aw1119184741', 7000, 'Collet cash', 1),
(171, '2016-11-21', 'Aw1119185138', 7600, 'Collet cash', 1),
(172, '2016-11-21', 'Marambe', 350, 'bookey expenses', 2),
(173, '2016-11-21', 'Ashvaya', 400, 'bookey expenses', 2),
(174, '2016-11-21', 'camil', 3000, 'dsasdasdad', 9),
(175, '2016-11-21', 'chameera', 250, 'sdsadasdasd', 8),
(176, '2016-11-21', 'charuka', 450, 'asdasdad', 7),
(177, '2016-11-22', 'Aw1119184741', 4500, 'Collet cash', 1),
(178, '2016-11-22', 'Aw1119185138', 8000, 'Collet cash', 1),
(179, '2016-11-22', 'Marambe', 350, 'bookey expenses', 2),
(180, '2016-11-22', 'Ayagama', 350, 'bookey expenses', 2),
(181, '2016-11-22', 'Ashvaya', 400, 'bookey expenses', 2),
(182, '2016-11-23', 'Aw1119184741', 4500, 'Collet cash', 1),
(183, '2016-11-23', 'Marambe', 350, 'bookey expenses', 2),
(184, '2016-11-23', 'Aw1119185138', 9500, 'Collet cash', 1),
(185, '2016-11-23', 'Ashvaya', 400, 'bookey expenses', 2),
(186, '2016-11-23', 'Aw112345033', 4800, 'Collet cash', 1),
(187, '2016-11-23', 'Aruna', 30, 'bookey expenses', 1),
(188, '2016-11-23', 'Aruna', 400, 'bookey expenses', 4),
(189, '2016-11-23', 'Chameera Kulasekara', 4000, 'dsfsdfsdf', 6),
(190, '2016-11-24', 'pathirana', 350, 'payroll', 7),
(191, '2016-11-24', 'Aw112345033', 5800, 'Collet cash', 1),
(192, '2016-11-24', 'Aruna', 30, 'bookey expenses', 1),
(193, '2016-11-24', 'Aruna', 400, 'bookey expenses', 4),
(194, '2016-11-24', 'Aw1119185138', 3500, 'Collet cash', 1),
(195, '2016-11-24', 'Ashvaya', 400, 'bookey expenses', 2),
(196, '2016-11-27', 'Aw1119184741', 3500, 'Collet cash', 1),
(197, '2016-11-27', 'Marambe', 350, 'bookey expenses', 2),
(198, '2016-11-27', 'Aw1119184741', 4000, 'Collet cash', 1),
(199, '2016-11-27', 'Aw112345033', 4000, 'Collet cash', 1),
(200, '2016-11-27', 'Aruna', 30, 'bookey expenses', 1),
(201, '2016-11-27', 'Aruna', 400, 'bookey expenses', 4),
(202, '2016-11-27', 'Aw1119185138', 5000, 'Collet cash', 1),
(204, '2016-11-29', 'Aw1119184741', 2600, 'Collet cash', 1),
(205, '2016-11-29', 'Aw1119185138', 5600, 'Collet cash', 1),
(206, '2016-11-29', 'Aw112345033', 3500, 'Collet cash', 1),
(207, '2016-11-30', 'Aw1119184741', 3500, 'Collet cash', 1),
(208, '2016-11-30', 'Aw1119185138', 9820, 'Collet cash', 1),
(209, '2016-11-30', 'Aw112345033', 9500, 'Collet cash', 1),
(210, '2016-11-30', 'Ashvaya', 400, 'bookey expenses', 2),
(211, '2016-11-30', 'Aruna', 30, 'bookey expenses', 1),
(212, '2016-11-30', 'Aruna', 400, 'bookey expenses', 4),
(213, '2016-11-30', 'Marambe', 350, 'bookey expenses', 2),
(214, '2016-11-30', 'Aw1130195316', 3500, 'Collet cash', 1),
(215, '2016-11-30', 'Aw1130195624', 7800, 'Collet cash', 1),
(216, '2016-11-30', 'Kalani', 360, 'bookey expenses', 2),
(217, '2016-11-30', 'Kalani', 100, 'bookey expenses', 4),
(218, '2016-11-30', 'Thoranagoda', 350, 'bookey expenses', 2),
(219, '2016-12-01', 'Aw1130195316', 4800, 'Collet cash', 1),
(220, '2016-12-01', 'Aw1130195624', 9500, 'Collet cash', 1),
(221, '2016-12-01', 'Thoranagoda', 350, 'bookey expenses', 2),
(222, '2016-12-01', 'Kalani', 360, 'bookey expenses', 2),
(223, '2016-12-01', 'Kalani', 100, 'bookey expenses', 4),
(224, '2016-12-01', 'malan perara', 56, 'sdstsdtsdtyedys', 2),
(226, '2016-12-01', 'Ra121223415', 3500, 'Collet cash', 1),
(227, '2016-12-01', 'weligama', 200, 'bookey expenses', 2),
(228, '2016-12-01', 'Ra12104022', 4500, 'Collet cash', 1),
(229, '2016-12-01', 'Ra12104022', 4500, 'Collet cash', 1),
(230, '2016-12-01', 'Dougles', 350, 'bookey expenses', 2),
(231, '2016-12-02', 'Ra121223415', 4500, 'Collet cash', 1),
(232, '2016-12-02', 'Ra12104022', 9800, 'Collet cash', 1),
(233, '2016-12-02', 'weligama', 200, 'bookey expenses', 2),
(234, '2016-12-02', 'Dougles', 350, 'bookey expenses', 2),
(235, '2016-12-01', 'Aw1119184741', 4500, 'Collet cash', 1),
(236, '2016-12-01', 'Ra121223415', 6800, 'Collet cash', 1),
(237, '2016-12-01', 'Ra12104022', 3500, 'Collet cash', 1),
(238, '2016-12-01', 'Marambe', 350, 'bookey expenses', 2),
(239, '2016-12-02', 'Aw1119184741', 4500, 'Collet cash', 1),
(240, '2016-12-02', 'Marambe', 350, 'bookey expenses', 2),
(241, '2016-12-02', 'Aw1119185138', 6800, 'Collet cash', 1),
(242, '2016-12-02', 'Ashvaya', 400, 'bookey expenses', 2),
(243, '2016-12-01', 'Aw1119184741', 3500, 'Collet cash', 1),
(244, '2016-12-01', 'Aw1119185138', 6800, 'Collet cash', 1),
(245, '2016-12-01', 'Aw112345033', 5800, 'Collet cash', 1),
(246, '2016-12-01', 'Aw1130195316', 4500, 'Collet cash', 1),
(247, '2016-12-01', 'Ra121223415', 5900, 'Collet cash', 1),
(248, '2016-12-01', 'Ra12104022', 4500, 'Collet cash', 1),
(249, '2016-12-01', 'Marambe', 350, 'bookey expenses', 2),
(250, '2016-12-01', 'Ashvaya', 400, 'bookey expenses', 2),
(251, '2016-12-01', 'weligama', 200, 'bookey expenses', 2),
(252, '2016-12-01', 'Dougles', 350, 'bookey expenses', 2),
(253, '2016-12-01', 'Aw1119184741', 4500, 'Collet cash', 1),
(254, '2016-12-01', 'Aw1119185138', 4500, 'Collet cash', 1),
(255, '2016-12-01', 'Ra121223415', 9000, 'Collet cash', 1),
(256, '2016-12-01', 'Ra12104022', 6600, 'Collet cash', 1),
(257, '2016-12-01', 'Marambe', 350, 'bookey expenses', 2),
(258, '2016-12-01', 'Ashvaya', 400, 'bookey expenses', 2),
(259, '2016-12-01', 'weligama', 200, 'bookey expenses', 2),
(260, '2016-12-01', 'Dougles', 350, 'bookey expenses', 2),
(261, '2016-12-01', 'Aw1130195316', 4900, 'Collet cash', 1),
(262, '2016-12-01', 'Aw1130195624', 5800, 'Collet cash', 1),
(263, '2016-12-01', 'Thoranagoda', 350, 'bookey expenses', 2),
(264, '2016-12-01', 'Kalani', 360, 'bookey expenses', 2),
(265, '2016-12-01', 'Kalani', 100, 'bookey expenses', 4),
(266, '2016-12-01', 'Hemantha', 4500, 'cdasdasd asd sad', 5),
(267, '2016-12-02', 'Aw1130195624', 2000, 'Collet cash', 1),
(268, '2016-12-02', 'Ra121223415', 4000, 'Collet cash', 1),
(269, '2016-12-02', 'Kalani', 360, 'bookey expenses', 2),
(270, '2016-12-02', 'Kalani', 100, 'bookey expenses', 4),
(271, '2016-12-02', 'weligama', 200, 'bookey expenses', 2),
(272, '2016-12-07', 'Aw1119184741', 1500, 'Collet cash', 1),
(273, '2016-12-07', 'Marambe', 350, 'bookey expenses', 2),
(274, '2016-12-07', 'Aw1119185138', 3503, 'Collet cash', 1),
(275, '2016-12-07', 'Ashvaya', 400, 'bookey expenses', 2),
(276, '2016-12-07', 'Aw112345033', 5325, 'Collet cash', 1),
(277, '2016-12-07', 'Aruna', 30, 'bookey expenses', 1),
(278, '2016-12-07', 'Aruna', 400, 'bookey expenses', 4),
(279, '2016-12-07', 'Aw1130195316', 3650, 'Collet cash', 1),
(280, '2016-12-07', 'Thoranagoda', 350, 'bookey expenses', 2),
(281, '2016-12-07', 'Aw1130195624', 4800, 'Collet cash', 1),
(282, '2016-12-07', 'Kalani', 360, 'bookey expenses', 2),
(283, '2016-12-07', 'Kalani', 100, 'bookey expenses', 4),
(284, '2016-12-09', 'Aw1119184741', 4500, 'Collet cash', 1),
(285, '2016-12-09', 'Marambe', 350, 'bookey expenses', 2),
(286, '2016-12-10', 'Aw1119184741', 6500, 'Collet cash', 1),
(287, '2016-12-10', 'Marambe', 350, 'bookey expenses', 2),
(288, '2016-01-10', 'Aw1119184741', 5000, 'Collet cash', 1),
(289, '2016-01-10', 'Aw1119185138', 4500, 'Collet cash', 1),
(290, '2016-01-10', 'Aw112345033', 4500, 'Collet cash', 1),
(291, '2016-01-10', 'Marambe', 350, 'bookey expenses', 2),
(292, '2016-01-10', 'Ashvaya', 400, 'bookey expenses', 2),
(293, '2016-01-10', 'Ra121223415', 4500, 'Collet cash', 1),
(294, '2016-01-10', 'Ga1104616', 4400, 'Collet cash', 1),
(295, '2016-01-10', 'Mu110476', 6600, 'Collet cash', 1),
(296, '2016-01-10', 'Janaka', 15, 'bookey expenses', 1),
(297, '2016-01-10', 'New star', 350, 'bookey expenses', 2),
(298, '2016-01-10', 'Aw1130195624', 6500, 'Collet cash', 1),
(299, '2016-01-10', 'Kalani', 360, 'bookey expenses', 2),
(300, '2016-01-10', 'Kalani', 100, 'bookey expenses', 4),
(301, '2016-12-10', 'Aw1130195316', 4500, 'Collet cash', 1),
(302, '2016-12-10', 'Aw1130195624', 4500, 'Collet cash', 1),
(303, '2016-12-10', 'Thoranagoda', 350, 'bookey expenses', 2),
(304, '2016-12-10', 'Kalani', 360, 'bookey expenses', 2),
(305, '2016-12-10', 'Kalani', 100, 'bookey expenses', 4),
(306, '2016-12-10', 'Mu110476', 3500, 'Collet cash', 1),
(307, '2016-12-10', 'New star', 350, 'bookey expenses', 2),
(308, '2016-12-10', 'Aw1119184741', 4500, 'Collet cash', 1),
(309, '2016-12-10', 'Marambe', 350, 'bookey expenses', 2),
(310, '2016-12-10', 'Aw1119184741', 4000, 'Collet cash', 1),
(311, '2016-12-10', 'Aw1119185138', 5000, 'Collet cash', 1),
(312, '2016-12-10', 'Ashvaya', 400, 'bookey expenses', 2),
(313, '2016-02-10', 'Aw1119185138', 450, 'Collet cash', 1),
(314, '2016-02-10', 'Ashvaya', 400, 'bookey expenses', 2),
(315, '2016-12-11', 'Aw1119184741', 4500, 'Collet cash', 1),
(316, '2016-12-11', 'Marambe', 350, 'bookey expenses', 2),
(317, '2016-12-15', 'Aw1119185138', 3500, 'Collet cash', 1),
(318, '2016-12-15', 'Aw112345033', 6500, 'Collet cash', 1),
(319, '2016-12-15', 'Aruna', 30, 'bookey expenses', 1),
(320, '2016-12-15', 'Aruna', 400, 'bookey expenses', 4),
(321, '2016-03-08', 'Aw1119184741', 3500, 'Collet cash', 1),
(322, '2016-03-08', 'Aw1119185138', 4000, 'Collet cash', 1),
(323, '2016-03-08', 'Aw112345033', 8600, 'Collet cash', 1),
(324, '2016-03-08', 'Marambe', 350, 'bookey expenses', 2),
(325, '2016-03-08', 'Ashvaya', 400, 'bookey expenses', 2),
(326, '2016-04-08', 'Aw1119184741', 4800, 'Collet cash', 1),
(327, '2016-04-08', 'Aw1119185138', 6800, 'Collet cash', 1),
(328, '2016-04-08', 'Marambe', 350, 'bookey expenses', 2),
(329, '2016-04-08', 'Ra121223415', 3500, 'Collet cash', 1),
(330, '2016-05-08', 'Mu110476', 4500, 'Collet cash', 1),
(331, '2016-05-08', 'New star', 350, 'bookey expenses', 2),
(332, '2016-05-08', 'chamo', 45000, 'fsfsdfsd', 6),
(333, '2016-02-01', 'vas', 60000, 'dasdasda', 2),
(334, '2017-01-24', 'Aw1119184741', 6000, 'Collet cash', 1),
(335, '2017-01-24', 'Marambe', 350, 'bookey expenses', 2);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_firstName` varchar(45) DEFAULT NULL,
  `user_lastName` varchar(45) DEFAULT NULL,
  `user_email` varchar(45) DEFAULT NULL,
  `user_status` varchar(45) DEFAULT NULL,
  `user_image` varchar(200) DEFAULT NULL,
  `user_phoneNumber` varchar(45) DEFAULT NULL,
  `user_gender` varchar(45) DEFAULT NULL,
  `user_dob` date DEFAULT NULL,
  `user_nic` varchar(45) DEFAULT NULL,
  `user_address` varchar(200) DEFAULT NULL,
  `user_uname` varchar(45) DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `fk_User_Role1_idx` (`role_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_firstName`, `user_lastName`, `user_email`, `user_status`, `user_image`, `user_phoneNumber`, `user_gender`, `user_dob`, `user_nic`, `user_address`, `user_uname`, `role_id`) VALUES
(1, 'Chamil', 'Pathirana', 'chamiljay88@gmail.com', 'Activate', '13883647_1129548333772606_1007861601_n.jpg', '0716460440', 'male', '1986-09-07', '862073428V', 'Oluwila Junction\r\nManiyangama', 'admin', 1),
(14, 'Rasika', 'Bandara', 'chamiljay88@gmail.com', 'Activate', '13883647_1129548333772606_1007861601_n.jpg', '0716460440', 'male', '1975-11-04', '752073428V', 'Oluwila Junction\r\nManiyangama', 'rasika', 5),
(16, 'namal', 'Kulasekarass', 'chamiljay88@gmail.com', 'Deactivate', 'Vijaya_01.jpg', '0716460440', 'male', '1979-11-15', '072384855V', 'Dandeniya road\r\nDandeniya', 'nishan', 5),
(18, 'Shivantha', 'pushpakumara', 'chamiljay88@gmail.com', 'Activate', 'WIN_20160524_18_52_26_Pro.jpg', '0716460440', 'male', '1976-11-23', '862073428V', 'Oluwila Junction\r\nManiyangama', 'shiva', 5),
(19, 'sumida', 'rathnayaka', 'chamiljay88@gmail.com', 'Activate', 'sureni.jpg', '0723485422', 'male', '1985-12-01', '882073428V', 'Oluwila Junction\r\nManiyangama', 'sumida', 5),
(20, 'Niromal', 'Anuradha', 'chamiljay88@gmail.com', 'Activate', 'nishan.jpg', '0716460440', 'male', '1988-12-01', '882073428V', 'Oluwila Junction\r\nManiyangama', 'niro', 5),
(21, 'Imal', 'Anuradha', 'madushan@gmail.com', 'Activate', 'sujeewa.jpg', '0716460440', 'male', '1979-01-01', '892073428V', 'Dandeniya road\r\nDandeniya', 'imal', 5),
(22, 'Sunil', 'Shanth', 'chamil@amerck.com', 'Activate', '13883647_1129548333772606_1007861601_n.jpg', '0717921765', 'male', '1975-12-03', '752073428V', 'Dandeniya road\r\nDandeniya', 'sunil', 5),
(23, 'Charuka', 'Gihan', 'namalyas@gmail.com', 'Activate', '7392611-3D-glass-sphere-Stock-Vector-ball.jpg', '0717921765', 'male', '1990-05-07', '902043728V', 'Dandeniya road\r\nDandeniya', 'charu', 4),
(24, 'Mervyn', 'Priyanth', 'chamiljay88@gmail.com', 'Activate', '3c8ddb3f9f9668665d7af4047533098c.jpg', '0716460440', 'male', '1978-12-06', '862073428V', 'Oluwila Junction\r\nManiyangama', 'mervyn', 5),
(25, 'Nisansala', 'Sandamali', 'namalyas@gmail.com', 'Deactivate', 'stock-vector-paper-candy-shop-label-with-ribbon-vector-illustration-349692365.jpg', '0723848558', 'female', '1977-05-02', '772043428V', 'Oluwila Junction\r\nManiyangama', 'nisa', 5);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `fk_Account_Account_category1` FOREIGN KEY (`account_category_id`) REFERENCES `account_category` (`account_category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `accountgeneral`
--
ALTER TABLE `accountgeneral`
  ADD CONSTRAINT `fk_AccountGeneral_Account1` FOREIGN KEY (`agent_id`) REFERENCES `agent` (`agent_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_AccountGeneral_GeneralCash_details1` FOREIGN KEY (`generalCash_details_id`) REFERENCES `generalcash_details` (`generalCash_details_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_AccountGeneral_User1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `accountgeneral_line`
--
ALTER TABLE `accountgeneral_line`
  ADD CONSTRAINT `fk_AccountGeneral_line_AccountGeneral1` FOREIGN KEY (`accountGeneral_id`) REFERENCES `accountgeneral` (`accountGeneral_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_AccountGeneral_line_Summery1` FOREIGN KEY (`summery_id`) REFERENCES `summery` (`summery_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `center`
--
ALTER TABLE `center`
  ADD CONSTRAINT `fk_Center_Account` FOREIGN KEY (`agent_id`) REFERENCES `agent` (`agent_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `centercash_details`
--
ALTER TABLE `centercash_details`
  ADD CONSTRAINT `fk_CenterCash_details_Account1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_FullCollection_Center1` FOREIGN KEY (`center_id`) REFERENCES `center` (`center_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `center_expenses`
--
ALTER TABLE `center_expenses`
  ADD CONSTRAINT `fk_Center_expenses_Center1` FOREIGN KEY (`center_id`) REFERENCES `center` (`center_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `collection_timebag`
--
ALTER TABLE `collection_timebag`
  ADD CONSTRAINT `fk_Collection_timeBag_Agent1` FOREIGN KEY (`agent_id`) REFERENCES `agent` (`agent_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Collection_timeBag_Runner1` FOREIGN KEY (`runner_id`) REFERENCES `runner` (`runner_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Collection_timeBag_User1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `collection_timebag_line`
--
ALTER TABLE `collection_timebag_line`
  ADD CONSTRAINT `fk_Collection_timeBag_line_Collection_timeBag1` FOREIGN KEY (`collection_timeBag_id`) REFERENCES `collection_timebag` (`collection_timeBag_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Collection_timeBag_line_Time_bag1` FOREIGN KEY (`time_bag_Code`) REFERENCES `time_bag` (`time_bag_Code`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `excess`
--
ALTER TABLE `excess`
  ADD CONSTRAINT `fk_Excess_Center1` FOREIGN KEY (`center_id`) REFERENCES `center` (`center_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `excess_line`
--
ALTER TABLE `excess_line`
  ADD CONSTRAINT `fk_Excess_line_Excess1` FOREIGN KEY (`excess_id`) REFERENCES `excess` (`excess_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
