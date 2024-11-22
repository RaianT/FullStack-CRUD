/*
  Warnings:

  - You are about to drop the `categoria` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `produto` DROP FOREIGN KEY `produto_ibfk_1`;

-- AlterTable
ALTER TABLE `produto` MODIFY `procategoria` VARCHAR(255) NULL;

-- DropTable
DROP TABLE `categoria`;
