-- CreateTable
CREATE TABLE `categoria` (
    `catcod` INTEGER NOT NULL AUTO_INCREMENT,
    `catdescricao` VARCHAR(20) NULL,

    PRIMARY KEY (`catcod`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `cliente` (
    `clicod` INTEGER NOT NULL AUTO_INCREMENT,
    `clinome` VARCHAR(80) NOT NULL,
    `clicelular` VARCHAR(15) NOT NULL,
    `cliemail` VARCHAR(30) NULL,
    `clidatanasc` DATE NULL,
    `clirua` VARCHAR(30) NULL,
    `clinumero` INTEGER NULL,
    `clibairro` VARCHAR(20) NULL,
    `clicep` VARCHAR(9) NULL,
    `clicomplemento` VARCHAR(30) NULL,

    PRIMARY KEY (`clicod`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `fornecedor` (
    `forcod` INTEGER NOT NULL AUTO_INCREMENT,
    `fornome` VARCHAR(80) NOT NULL,
    `forcelular` VARCHAR(15) NOT NULL,
    `foremail` VARCHAR(30) NULL,
    `forrua` VARCHAR(30) NULL,
    `fornumero` INTEGER NULL,
    `forbairro` VARCHAR(20) NULL,
    `forcep` VARCHAR(9) NULL,
    `forcomplemento` VARCHAR(30) NULL,

    PRIMARY KEY (`forcod`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `materiaprima` (
    `matcod` INTEGER NOT NULL AUTO_INCREMENT,
    `matnome` VARCHAR(30) NOT NULL,
    `matdescricao` VARCHAR(255) NULL,
    `matmarca` VARCHAR(30) NULL,
    `matpreco` DOUBLE NOT NULL,
    `matqtdestoque` INTEGER NOT NULL,

    PRIMARY KEY (`matcod`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `pagamento` (
    `pagcod` INTEGER NOT NULL AUTO_INCREMENT,
    `pagdescricao` VARCHAR(20) NULL,

    PRIMARY KEY (`pagcod`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `pedido` (
    `pedcod` INTEGER NOT NULL AUTO_INCREMENT,
    `peddtpedido` DATE NULL,
    `peddtentrega` DATE NULL,
    `pedqtdproduto` INTEGER NOT NULL,
    `pedcliente` INTEGER NULL,
    `pedvendedor` INTEGER NULL,
    `pedproduto` INTEGER NULL,
    `pedpagamento` INTEGER NULL,

    INDEX `pedcliente`(`pedcliente`),
    INDEX `pedpagamento`(`pedpagamento`),
    INDEX `pedproduto`(`pedproduto`),
    INDEX `pedvendedor`(`pedvendedor`),
    PRIMARY KEY (`pedcod`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `producao` (
    `prdcod` INTEGER NOT NULL AUTO_INCREMENT,
    `prddtcompra` DATE NULL,
    `prddiasconfeccao` INTEGER NULL,
    `prdfornecedor` INTEGER NULL,
    `prdmateriaprima` INTEGER NULL,
    `prdproduto` INTEGER NULL,

    INDEX `prdfornecedor`(`prdfornecedor`),
    INDEX `prdmateriaprima`(`prdmateriaprima`),
    INDEX `prdproduto`(`prdproduto`),
    PRIMARY KEY (`prdcod`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `produto` (
    `procod` INTEGER NOT NULL AUTO_INCREMENT,
    `pronome` VARCHAR(30) NOT NULL,
    `prodescricao` VARCHAR(255) NULL,
    `propreco` DOUBLE NOT NULL,
    `proqtdestoque` INTEGER NOT NULL,
    `procategoria` INTEGER NULL,
    `cor` VARCHAR(20) NULL,

    INDEX `procategoria`(`procategoria`),
    PRIMARY KEY (`procod`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `vendedor` (
    `vencod` INTEGER NOT NULL AUTO_INCREMENT,
    `vennome` VARCHAR(80) NOT NULL,
    `vencelular` VARCHAR(15) NOT NULL,
    `venemail` VARCHAR(30) NOT NULL,
    `venlogin` VARCHAR(15) NOT NULL,
    `vensenha` VARCHAR(8) NOT NULL,

    PRIMARY KEY (`vencod`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `pedido` ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`pedcliente`) REFERENCES `cliente`(`clicod`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `pedido` ADD CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`pedvendedor`) REFERENCES `vendedor`(`vencod`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `pedido` ADD CONSTRAINT `pedido_ibfk_3` FOREIGN KEY (`pedproduto`) REFERENCES `produto`(`procod`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `pedido` ADD CONSTRAINT `pedido_ibfk_4` FOREIGN KEY (`pedpagamento`) REFERENCES `pagamento`(`pagcod`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `producao` ADD CONSTRAINT `producao_ibfk_1` FOREIGN KEY (`prdfornecedor`) REFERENCES `fornecedor`(`forcod`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `producao` ADD CONSTRAINT `producao_ibfk_2` FOREIGN KEY (`prdmateriaprima`) REFERENCES `materiaprima`(`matcod`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `producao` ADD CONSTRAINT `producao_ibfk_3` FOREIGN KEY (`prdproduto`) REFERENCES `produto`(`procod`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `produto` ADD CONSTRAINT `produto_ibfk_1` FOREIGN KEY (`procategoria`) REFERENCES `categoria`(`catcod`) ON DELETE NO ACTION ON UPDATE NO ACTION;
