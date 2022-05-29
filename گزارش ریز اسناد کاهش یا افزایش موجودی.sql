SELECT
dbo.ConvertToJalaliDate(SD.BusinessDate) AS 'تاریخ سند',
SD.DocumentCode AS 'شماره سند',
SDL.LineItemID AS 'ردیف',
I.[Name] AS 'نام کالا',
I.Barcode AS 'بارکد',
--SD.TargetStockID AS 'انبار',
S.[Name] AS 'انبار',
--SDL.LastUnitCount AS 'موجودی کالا',
SDL.UnitCount AS 'تعداد',
SDL.Cost AS 'بهای خرید',
SDL.NetCost AS 'جمع مبلغ',
--SDL.SalePrice AS 'قیمت مصرف کننده',
SD.Comment AS 'دلایل'
--SD.DocumentID,
--SDL.DocumentID,
--SDL.ItemID

FROM StockDocumentLineItem SDL
LEFT JOIN StockDocument SD
ON SDL.DocumentID = SD.DocumentID
LEFT JOIN Item I
ON SDL.ItemID = I.ItemID
LEFT JOIN Stock S
ON SD.TargetStockID = S.StockID
WHERE SD.StatusID ='246' AND sd.DocumentTypeID = '382'
AND SD.BusinessDate BETWEEN '$StartDate' and '$EndDate'
AND SD.TargetStockID IN ($StockID)

