/*
Navicat MySQL Data Transfer

Source Server         : localhost:3307
Source Server Version : 50744
Source Host           : localhost:3307
Source Database       : sommusgestor

Target Server Type    : MYSQL
Target Server Version : 50744
File Encoding         : 65001

Date: 2024-01-19 21:12:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `instancia_banco_dados`
-- ----------------------------
DROP TABLE IF EXISTS `instancia_banco_dados`;
CREATE TABLE `instancia_banco_dados` (
  `instancia_banco_dados_id` int(11) NOT NULL AUTO_INCREMENT,
  `endereco` varchar(100) NOT NULL DEFAULT '',
  `porta` varchar(100) NOT NULL DEFAULT '',
  `usuario` varchar(100) NOT NULL DEFAULT '',
  `senha` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`instancia_banco_dados_id`),
  UNIQUE KEY `uk_instancia_banco_dados_1` (`endereco`,`porta`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of instancia_banco_dados
-- ----------------------------
INSERT INTO `instancia_banco_dados` VALUES ('1', '9AkzwATyjLDhj+AmXiHbpg==', 'khRgmI3eKg6rRpZUsrThEA==', 'T+njpRK3G/i70nn0bwdsbQ==', 'T+njpRK3G/i70nn0bwdsbQ==');
DROP TRIGGER IF EXISTS `bi_instancia_banco_dados`;
DELIMITER ;;
CREATE TRIGGER `bi_instancia_banco_dados` BEFORE INSERT ON `instancia_banco_dados` FOR EACH ROW begin
    if new.endereco = '' then
        signal sqlstate '45000' set message_text = 'invalid value: instancia_banco_dados.endereco';
    end if;
    if new.porta = '' then
        signal sqlstate '45000' set message_text = 'invalid value: instancia_banco_dados.porta';
    end if;
    if new.usuario = '' then
        signal sqlstate '45000' set message_text = 'invalid value: instancia_banco_dados.usuario';
    end if;
    if new.senha = '' then
        signal sqlstate '45000' set message_text = 'invalid value: instancia_banco_dados.senha';
    end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bu_instancia_banco_dados`;
DELIMITER ;;
CREATE TRIGGER `bu_instancia_banco_dados` BEFORE UPDATE ON `instancia_banco_dados` FOR EACH ROW begin
    if new.endereco = '' then
        signal sqlstate '45000' set message_text = 'invalid value: instancia_banco_dados.endereco';
    end if;
    if new.porta = '' then
        signal sqlstate '45000' set message_text = 'invalid value: instancia_banco_dados.porta';
    end if;
    if new.usuario = '' then
        signal sqlstate '45000' set message_text = 'invalid value: instancia_banco_dados.usuario';
    end if;
    if new.senha = '' then
        signal sqlstate '45000' set message_text = 'invalid value: instancia_banco_dados.senha';
    end if;
end
;;
DELIMITER ;
