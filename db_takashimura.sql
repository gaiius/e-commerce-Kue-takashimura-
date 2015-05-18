-- Adminer 4.2.0 MySQL dump

SET NAMES utf8mb4;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_lengkap` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `status` int(2) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `admin` (`id`, `nama_lengkap`, `username`, `password`, `status`) VALUES
(1,	'Administrator',	'admin',	'21232f297a57a5a743894a0e4a801fc3',	1);

DROP TABLE IF EXISTS `artikel`;
CREATE TABLE `artikel` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `judul` varchar(250) DEFAULT NULL,
  `content` text,
  `gambar` varchar(250) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `lastupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(2) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `artikel` (`id`, `judul`, `content`, `gambar`, `createdate`, `lastupdate`, `status`) VALUES
(1,	'kue',	'&lt;p&gt;tgdgdfg&lt;/p&gt;',	'Screenshot_2015-04-19-13-09-38-1_resized.png',	'2015-05-12 11:29:09',	'2015-05-12 04:29:09',	1);

DROP TABLE IF EXISTS `bank`;
CREATE TABLE `bank` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nama_bank` varchar(50) DEFAULT NULL,
  `nama_akun` varchar(50) DEFAULT NULL,
  `no_rekening` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `bank` (`id`, `nama_bank`, `nama_akun`, `no_rekening`) VALUES
(1,	'BANK BCA',	'Firgiawan Khafidli',	'8680.3634.56'),
(2,	'BANK MANDIRI',	'Firgiawan Khafidli',	'8680.3634.56');

DROP TABLE IF EXISTS `kategori`;
CREATE TABLE `kategori` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `kategori` (`id`, `nama`) VALUES
(1,	'Special Cakes'),
(2,	'Cake Slices'),
(3,	'Gist & Sweets'),
(4,	'Breads'),
(5,	'Occassions'),
(6,	'Traditional Cakes');

DROP TABLE IF EXISTS `konfirmasi`;
CREATE TABLE `konfirmasi` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `order_id` int(10) DEFAULT NULL,
  `member_id` int(10) DEFAULT NULL,
  `bank_id` int(10) DEFAULT NULL,
  `tgl_transfer` datetime DEFAULT NULL,
  `nominal` float(15,2) DEFAULT NULL,
  `nama_bank` varchar(50) DEFAULT NULL,
  `nama_akun` varchar(50) DEFAULT NULL,
  `no_rekening` varchar(50) DEFAULT NULL,
  `gambar` varchar(250) DEFAULT NULL,
  `status` int(2) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `konfirmasi` (`id`, `order_id`, `member_id`, `bank_id`, `tgl_transfer`, `nominal`, `nama_bank`, `nama_akun`, `no_rekening`, `gambar`, `status`) VALUES
(1,	1,	1,	1,	'2014-06-21 23:40:07',	43900.00,	'BANK BCA',	'Firgiawan Khafidli',	'8680.3634.56',	NULL,	2),
(2,	4,	1,	1,	'2014-06-22 00:00:00',	110700.00,	'BANK BCA',	'Firgiawan Khafidli',	'8680.3634.56',	'asset/upload/0b1d2f5fcea10bac00a0eeb6566f8aa7.jpg',	2);

DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nama_lengkap` varchar(250) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL DEFAULT 'L',
  `email` varchar(50) DEFAULT NULL,
  `telepon` varchar(50) DEFAULT NULL,
  `kota` varchar(50) DEFAULT NULL,
  `kode_pos` varchar(50) DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `status` int(2) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `member` (`id`, `nama_lengkap`, `tgl_lahir`, `jenis_kelamin`, `email`, `telepon`, `kota`, `kode_pos`, `alamat`, `username`, `password`, `status`) VALUES
(1,	'Wijaya Kusuma',	'1986-06-27',	'L',	'khafidli@ymail.com',	'088801129001',	'Tangerang',	'15143',	'Jl Rasuna Said No.55',	'member',	'aa08769cdcb26674c6706093503ff0a3',	1),
(2,	'atwinda',	'0000-00-00',	'P',	'nda.kembar@yahoo.com',	'021 5516521',	'tangerang',	'15132',	'jl.garuda 4 no 25',	'nda.kembar@yahoo.com',	'bec2d332fb6019ca4042ceee13a68633',	1),
(3,	'fahmi',	'2015-05-25',	'L',	'fahmi_the_eted@yahoo.co.id',	'32435435435435',	'ertertertert',	'34234234',	'4545245fdgdfg',	'fahmi',	'827ccb0eea8a706c4c34a16891f84e7b',	1),
(4,	'fahmi',	'2015-05-19',	'L',	'fahmi_the_eted@yahoo.co.id',	'32435435435435',	'ertertertert',	'34234234',	'gfgfgcg',	'user',	'e10adc3949ba59abbe56e057f20f883e',	1);

DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `no_order` varchar(10) DEFAULT NULL,
  `tgl_order` datetime DEFAULT NULL,
  `tgl_expired` datetime DEFAULT NULL,
  `member_id` int(10) DEFAULT NULL,
  `total_order` int(15) DEFAULT '0',
  `catatan` text,
  `status` int(11) DEFAULT '1' COMMENT '1 = PENDING, 2 = COMPLETED, -1 = CANCELLED',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `order` (`id`, `no_order`, `tgl_order`, `tgl_expired`, `member_id`, `total_order`, `catatan`, `status`) VALUES
(1,	'INV000001',	'2014-06-21 20:00:14',	'2014-07-21 20:00:15',	1,	43900,	'@sampel by admin',	2),
(2,	'INV000002',	'2014-06-21 20:00:14',	'2014-07-21 20:00:15',	1,	68900,	'@sampel by admin',	2),
(3,	'INV000003',	'2014-06-21 20:00:14',	'2014-07-21 20:00:15',	1,	43900,	'@sampel by admin',	1),
(4,	'INV000004',	'2014-06-22 23:10:09',	NULL,	1,	110700,	'@sampel by wijaya',	2),
(5,	'INV000005',	'2014-06-22 23:45:16',	NULL,	1,	46000,	'@sampel 123',	1),
(6,	'INV000006',	'2014-06-23 00:10:39',	NULL,	1,	109400,	'',	1),
(7,	'INV000007',	'2014-08-23 14:37:23',	NULL,	2,	95000,	'',	2),
(8,	'INV000008',	'2015-05-01 10:52:50',	NULL,	3,	1,	'',	1);

DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail` (
  `detail_id` int(10) NOT NULL AUTO_INCREMENT,
  `order_id` int(10) DEFAULT NULL,
  `produk_id` int(10) DEFAULT NULL,
  `atribut_id` int(10) DEFAULT '0',
  `satuan` varchar(50) DEFAULT NULL,
  `harga` int(10) DEFAULT '0',
  `diskon` int(10) DEFAULT '0',
  `qty` int(10) NOT NULL DEFAULT '1',
  `subtotal` int(15) DEFAULT '0',
  PRIMARY KEY (`detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `order_detail` (`detail_id`, `order_id`, `produk_id`, `atribut_id`, `satuan`, `harga`, `diskon`, `qty`, `subtotal`) VALUES
(1,	1,	12,	3,	'PCS',	21000,	10,	1,	18900),
(2,	1,	11,	0,	'PCS',	25000,	0,	1,	25000),
(3,	2,	12,	3,	'PCS',	21000,	10,	1,	18900),
(4,	2,	11,	0,	'PCS',	25000,	0,	2,	50000),
(5,	3,	12,	3,	'PCS',	21000,	10,	1,	18900),
(6,	3,	11,	0,	'PCS',	25000,	0,	1,	25000),
(7,	4,	12,	3,	'PCS',	21000,	10,	3,	56700),
(8,	4,	10,	0,	'PCS',	20000,	10,	3,	54000),
(9,	5,	7,	0,	'PCS',	21000,	0,	1,	21000),
(10,	5,	11,	0,	'PCS',	25000,	0,	1,	25000),
(11,	6,	11,	0,	'PCS',	25000,	0,	2,	50000),
(12,	6,	3,	0,	'PCS',	22000,	10,	3,	59400),
(13,	7,	12,	3,	'PCS',	75000,	0,	1,	75000),
(14,	7,	11,	0,	'PCS',	2000,	0,	10,	20000),
(15,	8,	7,	0,	'pcs',	1,	0,	1,	1);

DROP TABLE IF EXISTS `produk`;
CREATE TABLE `produk` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `kategori_id` int(10) DEFAULT NULL,
  `kode` varchar(10) DEFAULT NULL,
  `nama` varchar(250) DEFAULT NULL,
  `keterangan_singkat` tinytext,
  `keterangan_lengkap` text,
  `gambar` varchar(250) DEFAULT NULL,
  `harga` int(10) DEFAULT NULL,
  `diskon` int(10) DEFAULT '0',
  `satuan` varchar(50) DEFAULT '0',
  `createdate` datetime DEFAULT NULL,
  `lastupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(2) DEFAULT '1' COMMENT '1= available, 0 = non aktif',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `produk` (`id`, `kategori_id`, `kode`, `nama`, `keterangan_singkat`, `keterangan_lengkap`, `gambar`, `harga`, `diskon`, `satuan`, `createdate`, `lastupdate`, `status`) VALUES
(1,	1,	'P000001',	'1',	'Murah',	'',	'Screenshot_2015-04-19-13-07-59-1_resized.png',	10,	0,	'w',	'2015-05-01 10:42:49',	'2015-05-01 03:42:56',	1),
(2,	1,	'P000002',	'2',	'Murah',	'',	'Screenshot_2015-04-19-13-09-38-1_resized.png',	2,	0,	'w',	'2015-05-01 10:43:17',	'2015-05-01 03:43:17',	1),
(3,	1,	'P000003',	'3',	'Murah',	'',	'Screenshot_2015-04-19-13-11-43-1_resized.png',	454545454,	0,	'e',	'2015-05-01 10:43:36',	'2015-05-01 03:44:49',	1),
(4,	1,	'P000004',	'4',	'Murah',	'',	'Screenshot_2015-04-19-13-23-44-1_resized.png',	4,	0,	'r',	'2015-05-01 10:43:52',	'2015-05-01 03:43:52',	1),
(5,	5,	'P000005',	'5',	'Murah',	'',	'Screenshot_2015-04-19-13-24-03-1_resized.png',	5555,	0,	't',	'2015-05-01 10:44:14',	'2015-05-01 03:44:21',	1),
(6,	1,	'P000006',	'6',	'Murah',	'',	'Screenshot_2015-04-19-13-24-15-1_resized.png',	5,	0,	'pcs',	'2015-05-01 10:45:15',	'2015-05-01 03:45:15',	1),
(7,	1,	'P000007',	'7',	'Murah',	'',	'Screenshot_2015-04-19-13-24-37-1_resized.png',	6,	0,	'yt',	'2015-05-01 10:45:35',	'2015-05-01 03:45:35',	1),
(8,	1,	'P000008',	'88',	'Murah',	'',	'Screenshot_2015-04-19-13-24-58-1_resized.png',	6,	0,	'80',	'2015-05-01 10:46:41',	'2015-05-01 03:46:41',	1),
(9,	1,	'P000009',	'666',	'Murah',	'',	'Screenshot_2015-04-19-13-25-08-1_resized.png',	6,	0,	'8',	'2015-05-01 10:47:09',	'2015-05-01 03:47:09',	1),
(10,	1,	'P000010',	'67',	'Murah',	'',	'Screenshot_2015-04-19-13-24-37-1_resized.png',	57,	0,	'e',	'2015-05-01 10:47:39',	'2015-05-01 03:47:39',	1),
(11,	1,	'P000011',	'Kue Gulungss',	'Murah',	'',	'Screenshot_2015-04-19-13-35-17-1_resized.png',	5550,	0,	'77',	'2015-05-01 10:48:27',	'2015-05-01 03:48:27',	1),
(12,	2,	'P000012',	'Kue Gulung',	'Murah',	'',	'Screenshot_2015-04-19-13-24-03-1_resized.png',	566,	0,	'pcs',	'2015-05-01 10:48:59',	'2015-05-01 03:48:59',	1),
(13,	3,	'P000013',	'3',	'Murah',	'',	'Screenshot_2015-04-19-13-35-17-1_resized.png',	45435,	0,	'pcs',	'2015-05-01 10:49:28',	'2015-05-01 03:49:28',	1),
(14,	4,	'P000014',	'Kue Gulung',	'Murah',	'',	'Screenshot_2015-04-19-13-38-10-1_resized.png',	4,	0,	'pcs',	'2015-05-01 10:49:58',	'2015-05-01 03:49:58',	1);

DROP TABLE IF EXISTS `produk_atribut`;
CREATE TABLE `produk_atribut` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `produk_id` int(10) NOT NULL DEFAULT '0',
  `nama` varchar(50) DEFAULT NULL,
  `harga` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `produk_atribut` (`id`, `produk_id`, `nama`, `harga`) VALUES
(3,	12,	'Rasa Coklat',	75000),
(4,	12,	'Rasa Strawbery',	75000);

DROP TABLE IF EXISTS `testimonial`;
CREATE TABLE `testimonial` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `member_id` int(10) NOT NULL DEFAULT '0',
  `komentar` text NOT NULL,
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `testimonial` (`id`, `member_id`, `komentar`, `createdate`, `status`) VALUES
(1,	1,	'Saya selalu beli kue ultah\rdisini, selain harganya murah \rjuga rasanya enak\rT.O.P banget (^^) ',	'2014-06-22 00:03:46',	1);

-- 2015-05-12 10:28:01
