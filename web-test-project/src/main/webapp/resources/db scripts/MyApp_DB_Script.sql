CREATE  TABLE `MyApp_DB`.`sub_product_category` (
  `sub_cat_id` INT NOT NULL AUTO_INCREMENT ,
  `sub_cat_name` VARCHAR(20) NOT NULL ,
  `cat_id` INT NOT NULL ,
  `user_id` INT NOT NULL ,
  `created_on` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  PRIMARY KEY (`sub_cat_id`) ,
  INDEX `fk_sub_product_category_1` (`cat_id` ASC) ,
  CONSTRAINT `fk_sub_product_category_1`
    FOREIGN KEY (`cat_id` )
    REFERENCES `MyApp_DB`.`product_category` (`p_cat_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



CREATE  TABLE `MyApp_DB`.`products` (
  `product_id` INT NOT NULL AUTO_INCREMENT ,
  `product_name` VARCHAR(45) NOT NULL ,
  `product_brand` VARCHAR(45) NOT NULL ,
  `product_price` DOUBLE NOT NULL ,
  `product_specifications` VARCHAR(100) NOT NULL ,
  `product_photos` VARCHAR(100) NOT NULL ,
  `product_offer` VARCHAR(45) NOT NULL ,
  `created_on` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  `user_id` INT NOT NULL ,
  `sub_category_id` INT NOT NULL ,
  `category_id` INT NOT NULL ,
  PRIMARY KEY (`product_id`) ,
  INDEX `fk_products_1` (`sub_category_id` ASC) ,
  CONSTRAINT `fk_products_1`
    FOREIGN KEY (`sub_category_id` )
    REFERENCES `MyApp_DB`.`sub_product_category` (`sub_cat_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

ALTER TABLE `MyApp_DB`.`products` CHANGE COLUMN `product_specifications` `product_specifications` INT NOT NULL  ;



CREATE  TABLE `MyApp_DB`.`product_specifications` (
  `specification_id` INT NOT NULL AUTO_INCREMENT ,
  `specification_detail` VARCHAR(300) NOT NULL ,
  PRIMARY KEY (`specification_id`) );



CREATE  TABLE `MyApp_DB`.`client` (
  `client_id` INT NOT NULL AUTO_INCREMENT ,
  `client_name` VARCHAR(20) NOT NULL ,
  `email` VARCHAR(30) NOT NULL ,
  `mobile` VARCHAR(10) NOT NULL ,
  `address` VARCHAR(80) NOT NULL ,
  `pincode` VARCHAR(10) NOT NULL ,
  `userId` INT NOT NULL ,
  `created_on` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  PRIMARY KEY (`client_id`) ,
  INDEX `fk_client_1` (`userId` ASC) ,
  CONSTRAINT `fk_client_1`
    FOREIGN KEY (`userId` )
    REFERENCES `MyApp_DB`.`users` (`user_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


CREATE  TABLE `MyApp_DB`.`transaction` (
  `transaction_id` INT NOT NULL AUTO_INCREMENT ,
  `client_id` INT NOT NULL ,
  `category_id` INT NOT NULL ,
  `subCat_id` INT NOT NULL ,
  `product_id` INT NOT NULL ,
  `balance` DOUBLE NOT NULL ,
  `created_on` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  `quantity` INT NOT NULL ,
  PRIMARY KEY (`transaction_id`) ,
  INDEX `fk_transaction_client_id` (`client_id` ASC) ,
  INDEX `fk_transaction_cat_id` (`category_id` ASC) ,
  INDEX `fk_transaction_subCat_id` (`subCat_id` ASC) ,
  INDEX `fk_transaction_4` (`product_id` ASC) ,
  CONSTRAINT `fk_transaction_client_id`
    FOREIGN KEY (`client_id` )
    REFERENCES `MyApp_DB`.`client` (`client_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transaction_cat_id`
    FOREIGN KEY (`category_id` )
    REFERENCES `MyApp_DB`.`product_category` (`p_cat_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transaction_subCat_id`
    FOREIGN KEY (`subCat_id` )
    REFERENCES `MyApp_DB`.`sub_product_category` (`sub_cat_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transaction_4`
    FOREIGN KEY (`product_id` )
    REFERENCES `MyApp_DB`.`products` (`product_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

ALTER TABLE `MyApp_DB`.`transaction` ADD COLUMN `client_name` VARCHAR(20) NOT NULL  AFTER `quantity` ;

ALTER TABLE `MyApp_DB`.`client` ADD COLUMN `balance` DOUBLE NOT NULL  AFTER `userId` ;

ALTER TABLE MyApp_DB.transaction CHANGE balance transaction_amount DOUBLE;


ALTER TABLE `MyApp_DB`.`transaction` ADD COLUMN `user_id` INT NOT NULL  AFTER `client_name` , CHANGE COLUMN `transaction_amount` `transaction_amount` DOUBLE NOT NULL  , 
  ADD CONSTRAINT `fk_transaction_user_id`
  FOREIGN KEY (`user_id` )
  REFERENCES `MyApp_DB`.`users` (`user_id` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
, ADD INDEX `fk_transaction_user_id` (`user_id` ASC) ;



ALTER TABLE `MyApp_DB`.`transaction` ADD COLUMN `product_name` VARCHAR(45) NOT NULL  AFTER `user_id` ;


CREATE  TABLE `MyApp_DB`.`stock` (
  `stock_id` INT NOT NULL AUTO_INCREMENT ,
  `cat_id` INT NOT NULL ,
  `sub_cat_id` INT NOT NULL ,
  `product_id` INT NOT NULL ,
  `product_name` VARCHAR(45) NOT NULL ,
  `stock_out` INT NOT NULL ,
  `stock_in` INT NOT NULL ,
  `created_on` TIMESTAMP NOT NULL ,
  PRIMARY KEY (`stock_id`) ,
  INDEX `fk_stock_cat_id` (`cat_id` ASC) ,
  INDEX `fk_stock_sub_cat_id` (`sub_cat_id` ASC) ,
  INDEX `fk_stock_product_id` (`product_id` ASC) ,
  CONSTRAINT `fk_stock_cat_id`
    FOREIGN KEY (`cat_id` )
    REFERENCES `MyApp_DB`.`product_category` (`p_cat_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stock_sub_cat_id`
    FOREIGN KEY (`sub_cat_id` )
    REFERENCES `MyApp_DB`.`sub_product_category` (`sub_cat_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stock_product_id`
    FOREIGN KEY (`product_id` )
    REFERENCES `MyApp_DB`.`products` (`product_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

ALTER TABLE `MyApp_DB`.`stock` CHANGE COLUMN `stock_out` `stock_out` INT(11) NULL  ;


ALTER TABLE `MyApp_DB`.`products` ADD COLUMN `quantity` INT NOT NULL  AFTER `category_id` ;

ALTER TABLE `MyApp_DB`.`products` ADD COLUMN `sold_quantity` INT NULL  AFTER `quantity` ;

ALTER TABLE `MyApp_DB`.`products` CHANGE COLUMN `sold_quantity` `sold_quantity` INT(11) NOT NULL DEFAULT 0  ;

CREATE  TABLE `MyApp_DB`.`vandor` (
  `vandor_id` INT NOT NULL AUTO_INCREMENT ,
  `vandor_company` VARCHAR(45) NOT NULL ,
  `vandor_email` VARCHAR(45) NOT NULL ,
  `vandor_mobile` VARCHAR(10) NOT NULL ,
  `vandor_address` VARCHAR(100) NOT NULL ,
  `vandor_pincode` VARCHAR(6) NOT NULL ,
  `user_id` INT NOT NULL ,
  `created_on` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  PRIMARY KEY (`vandor_id`) ,
  INDEX `fk_vandor_1` (`user_id` ASC) ,
  CONSTRAINT `fk_vandor_1`
    FOREIGN KEY (`user_id` )
    REFERENCES `MyApp_DB`.`users` (`user_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

    ALTER TABLE `MyApp_DB`.`vandor` RENAME TO  `MyApp_DB`.`vendor` ;

    ALTER TABLE `MyApp_DB`.`vendor` CHANGE COLUMN `vandor_id` `vendor_id` INT(11) NOT NULL AUTO_INCREMENT  , CHANGE COLUMN `vandor_company` `vendor_company` VARCHAR(45) NOT NULL  , CHANGE COLUMN `vandor_email` `vendor_email` VARCHAR(45) NOT NULL  , CHANGE COLUMN `vandor_mobile` `vendor_mobile` VARCHAR(10) NOT NULL  , CHANGE COLUMN `vandor_address` `vendor_address` VARCHAR(100) NOT NULL  , CHANGE COLUMN `vandor_pincode` `vendor_pincode` VARCHAR(6) NOT NULL  ;

    CREATE  TABLE `MyApp_DB`.`vendor_products` (
  `vp_id` INT NOT NULL AUTO_INCREMENT ,
  `vendor_id` INT NOT NULL ,
  `vendor_name` VARCHAR(45) NOT NULL ,
  `product_id` INT NOT NULL ,
  `product_name` VARCHAR(45) NOT NULL ,
  `created_on` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  PRIMARY KEY (`vp_id`) ,
  INDEX `fk_vendor_products_1` (`vendor_id` ASC) ,
  INDEX `fk_vendor_products_2` (`product_id` ASC) ,
  CONSTRAINT `fk_vendor_products_1`
    FOREIGN KEY (`vendor_id` )
    REFERENCES `MyApp_DB`.`vendor` (`vendor_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vendor_products_2`
    FOREIGN KEY (`product_id` )
    REFERENCES `MyApp_DB`.`products` (`product_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

    CREATE  TABLE `MyApp_DB`.`invoice` (
  `invoice_id` INT NOT NULL AUTO_INCREMENT ,
  `invoice_name` VARCHAR(45) NULL ,
  `created_on` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  PRIMARY KEY (`invoice_id`) );

  CREATE  TABLE `MyApp_DB`.`invoice_detail` (
  `invoice_detail_id` INT NOT NULL AUTO_INCREMENT ,
  `client_id` INT NOT NULL ,
  `client_name` VARCHAR(45) NOT NULL ,
  `product_id` INT NOT NULL ,
  `product_name` VARCHAR(45) NOT NULL ,
  `quantity` INT NOT NULL ,
  `price` DOUBLE NOT NULL ,
  `invoice_id` INT NOT NULL ,
  PRIMARY KEY (`invoice_detail_id`) ,
  INDEX `fk_invoice_detail_1` (`invoice_id` ASC) ,
  CONSTRAINT `fk_invoice_detail_1`
    FOREIGN KEY (`invoice_id` )
    REFERENCES `MyApp_DB`.`invoice` (`invoice_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

    ALTER TABLE `MyApp_DB`.`products` ADD COLUMN `sale_price` DOUBLE NOT NULL  AFTER `sold_quantity` , CHANGE COLUMN `product_price` `cost_price` DOUBLE NOT NULL  ;

    CREATE  TABLE `MyApp_DB`.`user_role` (
  `user_role_id` INT NOT NULL AUTO_INCREMENT ,
  `user_id` INT NOT NULL ,
  `role` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`user_role_id`) ,
  INDEX `fk_user_role_1` (`user_id` ASC) ,
  CONSTRAINT `fk_user_role_1`
    FOREIGN KEY (`user_id` )
    REFERENCES `MyApp_DB`.`users` (`user_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

ALTER TABLE `MyApp_DB`.`users` CHANGE COLUMN `role` `status` VARCHAR(10) NOT NULL  ;

ALTER TABLE `MyApp_DB`.`users` 
ADD UNIQUE INDEX `user_name_UNIQUE` (`user_name` ASC) ;

ALTER TABLE `MyApp_New_Release_DB`.`per_product_stock` RENAME TO  `MyApp_New_Release_DB`.`product_wise_stock` ;
ALTER TABLE `MyApp_New_Release_DB`.`product_batch` DROP COLUMN `product_name` ;
ALTER TABLE `MyApp_New_Release_DB`.`product_batch` ADD COLUMN `product_name` VARCHAR(45) NOT NULL AFTER `client_id` ;
