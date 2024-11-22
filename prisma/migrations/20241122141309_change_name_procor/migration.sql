/*
  Warnings:

  - You are about to drop the column `cor` on the `produto` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE `produto` DROP COLUMN `cor`,
    ADD COLUMN `procor` VARCHAR(20) NULL;
