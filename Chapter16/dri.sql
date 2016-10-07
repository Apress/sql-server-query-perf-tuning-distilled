/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

USE Northwind
GO

ALTER TABLE od
ADD
  CONSTRAINT FK_Orders FOREIGN KEY (OrderID)
    REFERENCES Orders(OrderID),
  CONSTRAINT FK_Products FOREIGN KEY (ProductID)
    REFERENCES Products(ProductID)
GO
