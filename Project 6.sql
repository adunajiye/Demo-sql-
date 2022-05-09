Create database rawdatacleaning
Select * from [dbo].['Order List$']

Select count([Order ID]) as Number_of_orders
from ['Order List$']

-- Separate Order Date from time into different columns
select [Order Date],cast([Order Date] as date)as New_Order_Date 
 from ['Order List$']

 Update ['Order List$']
 set [Order Date] = cast([Order Date] as date)

 Alter table ['Order List$']
 add New_Order_Date date

 update ['Order List$']
 set New_Order_Date = cast([Order Date] as date)

 select * from ['Order List$']
  /* Remove Replace Null values and separate date fromat from time 
  Firstly, separate the values into different columns  */

  select [Shipped Date],CAST([Shipped Date] as date) as New_shipped_Date
  from ['Order List$']

  update ['Order List$']
  set [Shipped Date] = CAST([Shipped Date] as date)

  Alter table ['Order List$']
  add New_Shipped_Datee date

 update ['Order List$']
 set New_Shipped_Datee = cast([Shipped Date] as date)

 Select * from ['Order List$']


 -- Replace Null Values with "No Date"
 -- Remove Unused Values
 Alter Table ['Order List$']
 drop column [Shipped Date]
 select * from ['Order List$']

 -- Exploration Data
 select  sum([Order Total]) as Total_Orders   /* Total Orders For this Project is $70,032 */
 from ['Order List$']


 -- Using CTE[Common Table Expression] fORMAT
 select Distinct a.[Employee ID]
 ,b.[Order Total]  
 -- ,(CAST(b.[Order Total] as float) / a.[Order Total]) * 100 as Percentage_By_Orders
 from ['Order List$']a
 Left Join  ['Order List$']b 
 on(a.[Employee ID] = b.[Employee ID]
 AND b.[Order Total] = a.[Order Total])
 WHERE a.[Employee ID]  IS NOT NULL
 order By 2 Desc

 -- Getting the percentage of each Employee ID 
 Select  Distinct [Employee ID]
 ,sum(Cast([Order Total] as int )) as Total_Orders
 ,sum(Cast([Order Total] as int )) * 100 / (select sum([Order Total]) from ['Order List$']) as Percentage_Orders
 from ['Order List$']
 where [Employee ID]  IS NOT NULL
 Group By [Employee ID]
 Order By 2 Desc

 Select * from ['Order List$']
 -- Replace Null Values with Nil
 Delete from  ['Order List$']
 where [Customer Name] = 'Null'

 -- Remove all Null values in all columns
 select ISNULL([Customer Name],0) AS New_Customer_Name
 ,ISNULL([order ID],0) as New_Order_ID 
 ,ISNULL([Employee ID],0) as New_Employee_ID
 ,ISNULL([status],0) as New_Status
 ,ISNULL([Product ID],0) as New_Product_ID
 ,ISNULL([Shipping Fee],0) as New_Shipping_Fee
 ,ISNULL([Taxes],0) as New_Taxes
 ,ISNULL([Order Total],0) as New_Order_Total

 from ['Order List$']

 -- Update all Isnull Values in all columns 
  update ['Order List$']
  set [Customer Name] = ISNULL([Customer Name],0) 
  update ['Order List$']
  set [order ID] = ISNULL([order ID],0) 
    update ['Order List$']
  set [Order Total] = ISNULL([Order Total],0) 
    update ['Order List$']
  set [Taxes] = ISNULL([order ID],0) 
    update ['Order List$']
  set [Product ID] = ISNULL([Product ID],0) 
    update ['Order List$']
  set [status] = ISNULL([status],0) 
   update ['Order List$']
  set [Employee ID] = ISNULL([Employee ID],0) 
update ['Order List$']
  set [Shipping Fee] = ISNULL([Shipping Fee],0) 

  Alter table ['Order List$']
  add [CustomerNamee ] text 
  Alter table ['Order List$']
  add [Employee IDD ] text 
  Alter table ['Order List$']
  add [Order IDD  ] Int
  Alter table ['Order List$']
  add [Statuss] text 
  Alter table ['Order List$']
  add [Product IDD ] Int
  Alter table ['Order List$']
  add [Shipping Feee ] Int
  Alter table ['Order List$']
  add [Taxess] BigInt
  Alter table ['Order List$']
  add [Order Totall ] smallInt


-- DROP THE USELESS COLUMNS YOU HAVE CREATED 
 Alter Table ['Order List$']
 drop column [CustomerNamee]
 ,[Employee IDD]
 ,[Order IDD]
 ,Statuss
 ,[Product IDD]
 ,[Shipping Feee]
 ,Taxess
 ,[Order Totall]

 select * from  ['Order List$']


  Delete from  ['Order List$']
 where [Customer Name] = '0'

 --  Customer Name with the Highest Total Orders
 Select Distinct [Customer Name]
 ,sum(cast([Order Total] as int)) as Total_Orders 
 ,sum(cast([Order Total] as float)) * 100 /(select sum([Order Total]) from  ['Order List$']) as Percentage_Total
 from ['Order List$']
 group by [Customer Name]
 Order By 2 Desc

 -- Total Orders 
 select * from ['Order List$']

 -- Status of Order closed By Customer Name
 select Distinct [Status]
,count(Status) 
FROM ['Order List$'] 

select count(Status) from ['Order List$']
