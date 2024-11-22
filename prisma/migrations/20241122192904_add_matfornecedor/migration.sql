/*
  Warnings:

  - You are about to drop the `cliente` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `fornecedor` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `pagamento` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `pedido` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `producao` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `vendedor` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `pedido` DROP FOREIGN KEY `pedido_ibfk_1`;

-- DropForeignKey
ALTER TABLE `pedido` DROP FOREIGN KEY `pedido_ibfk_2`;

-- DropForeignKey
ALTER TABLE `pedido` DROP FOREIGN KEY `pedido_ibfk_3`;

-- DropForeignKey
ALTER TABLE `pedido` DROP FOREIGN KEY `pedido_ibfk_4`;

-- DropForeignKey
ALTER TABLE `producao` DROP FOREIGN KEY `producao_ibfk_1`;

-- DropForeignKey
ALTER TABLE `producao` DROP FOREIGN KEY `producao_ibfk_2`;

-- DropForeignKey
ALTER TABLE `producao` DROP FOREIGN KEY `producao_ibfk_3`;

-- AlterTable
ALTER TABLE `materiaprima` ADD COLUMN `matfornecedor` VARCHAR(100) NULL;

-- DropTable
DROP TABLE `cliente`;

-- DropTable
DROP TABLE `fornecedor`;

-- DropTable
DROP TABLE `pagamento`;

-- DropTable
DROP TABLE `pedido`;

-- DropTable
DROP TABLE `producao`;

-- DropTable
DROP TABLE `vendedor`;
