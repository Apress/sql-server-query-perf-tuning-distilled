/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

USE Northwind

ALTER TABLE od
  ADD CONSTRAINT fk_ProdID FOREIGN KEY (ProductID)
    REFERENCES Prod(ProductID)
