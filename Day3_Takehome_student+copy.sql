# Pre-Requisites:
# Step 1 : Create table as below.
use inclass;
Create table Bank_Inventory_pricing ( Product CHAR(15) , Quantity INT, Price  Real ,
purchase_cost Decimal(6,2), Estimated_sale_price  Float,
Month int) ;

# Step2: 
# Insert records for above 
 Insert into Bank_Inventory_pricing values ( 'PayCard'   , 2 , 300.45, 8000.87, 9000.56, 1 ) ;
 Insert into Bank_Inventory_pricing values ( 'PayCard'   , 2 , 800.45, 5000.80, 8700.56, 1 ) ;
 Insert into Bank_Inventory_pricing values ( 'PayCard'   , 2 , 500.45, 6000.47, 7400.56, 1 ) ;
 Insert into Bank_Inventory_pricing values ( 'PayPoints' , 4 , 390.87, 7000.67, 6700.56, 2)  ;
 Insert into Bank_Inventory_pricing values ( 'SmartPay' , 5  , 290.69, 5600.77, 3200.12 , 1)  ;
 Insert into Bank_Inventory_pricing values ( 'MaxGain',  3 , NULL, 4600.67, 3233.11 , 1 ) ;
 Insert into Bank_Inventory_pricing values ( 'MaxGain',  6 , 220.39, 4690.67, NULL , 2 ) ;
 Insert into Bank_Inventory_pricing values ( 'SuperSave', 7 , 290.30, NULL, 3200.13 ,1 ) ;
 Insert into Bank_Inventory_pricing values ( 'SuperSave', 6 , 560.30, NULL, 4200.13 ,1 ) ;
 Insert into Bank_Inventory_pricing values ( 'SuperSave', 6 , NULL, 2600.77, 3200.13 ,2 ) ;
 Insert into Bank_Inventory_pricing values ( 'SuperSave', 9 , NULL, 5400.71, 9200.13 ,3 ) ;
 Insert into Bank_Inventory_pricing values ( 'SmartSav',   3 , 250.89, 5900.97, NULL ,1 ) ;
 Insert into Bank_Inventory_pricing values ( 'SmartSav',   3 , 250.89, 5900.97, 8999.34 ,1 ) ;
 Insert into Bank_Inventory_pricing values ( 'SmartSav',   3 , 250.89, NULL , 5610.82 , 2 ) ;
 Insert into Bank_Inventory_pricing values ( 'EasyCash',   3 , 250.89, NULL, 5610.82 ,1 ) ;
 Insert into Bank_Inventory_pricing values ( 'EasyCash',   3 , 250.89, NULL, 5610.82 , 2 ) ;
 Insert into Bank_Inventory_pricing values ( 'EasyCash',   3 , 250.89, NULL, 5610.82 , 3 ) ;
 Insert into Bank_Inventory_pricing values ( 'BusiCard'  ,  1, 3000.99 , NULL, 3500, 3) ; 
 Insert into Bank_Inventory_pricing values ( 'BusiCard'  ,  1, 4000.99 , NULL, 3500, 2) ; 

# Create table
Create table Bank_branch_PL
(Branch   varchar(15),
  Banker   Int,
  Product varchar(15) ,
  Cost  Int,
  revenue Int,
  Estimated_profit Int,   
  month  Int);
Insert into Bank_branch_PL values ( 'Delhi', 99101, 'SuperSave', 30060070, 50060070,  20050070, 1 ) ;
Insert into Bank_branch_PL values ( 'Delhi', 99101, 'SmartSav',   45060070, 57060070, 30050070, 2) ;
Insert into Bank_branch_PL values ( 'Delhi', 99101, 'EasyCash',   66660070, 50090090, 10050077, 3) ;
Insert into Bank_branch_PL values ( 'Hyd', 99101, 'SmartSav',   66660070, 79090090, 10050077, 3) ;
Insert into Bank_branch_PL values ( 'Banglr', 77301, 'EasyCash',   55560070, 61090090, 9950077, 3) ;
Insert into Bank_branch_PL values ( 'Banglr', 77301, 'SmartSav',   54460090, 53090080, 19950077, 3) ;
Insert into Bank_branch_PL values ( 'Hyd', 77301, 'SmartSav',   53060090, 63090080, 29950077, 3) ;
Insert into Bank_branch_PL values ( 'Hyd', 88201, 'BusiCard',  	40030070, 60070080, 10050070,1) ;
Insert into Bank_branch_PL values ( 'Hyd', 88201, 'BusiCard',  	70030070, 60070080, 25060070,1) ;
Insert into Bank_branch_PL values ( 'Hyd', 88201, 'SmartSav', 	40054070, 60070080, 20050070, 2) ;
Insert into Bank_branch_PL values ( 'Banglr', 99101, 'SmartSav',   88660070, 79090090, 10050077, 3) ;


############################################ Questions ############################################

# Question 1:
# 1)  For every branch find the sum of calculated profit after ignoring the loss.   
/* Solution */
use inclass;
select * from bank_branch_pl;
select branch,sum(revenue-cost) calculated_profit from bank_branch_pl 
where revenue-cost>0 group by branch;
-------------------------------------------------------------------------------------------------------------
# Question 2:
# 2)  Find the average Estimated_ sale_price for each product  
/* Solution */
select product,avg(estimated_sale_price) from bank_inventory_pricing group by product;
-------------------------------------------------------------------------------------------------------------
# Question 3:
# 3)  Find the  month wise total quantity of each product
/* Solution */
select product,sum(quantity),month from bank_inventory_pricing group by month ;
-------------------------------------------------------------------------------------------------------------
# Question 4:
# 4)  Find the maximum profit(Estimated_sale_price-Purchase_cost) for each product (Hint: Do not display loss).
/* Solution */
select product,max(estimated_sale_price-purchase_cost) from bank_inventory_pricing group by product;
-------------------------------------------------------------------------------------------------------------
# Question 5:
# 5)  Find the minimum revenue for each banker if estimated_profit is greater than 20000000.
/* Solution */
select * from bank_branch_pl;
select banker,min(revenue) from bank_branch_pl where estimated_profit>20000000 group by banker ;
-------------------------------------------------------------------------------------------------------------
/* Pre-requisite */
## Use tables Bank_Inventory_pricing, Bank_branch_PL from Online_Day5_InClass to solve following queries

# Question 6:
# 6) Display the products and month where the total Quantity in Bank Inventory was more than 6.  
select product,month from bank_inventory_pricing group by product,month having sum(quantity)>6 ;
-------------------------------------------------------------------------------------------------------------
# Question 7:
# 7) IF Real profit is calculated as : 		Real Profit = revenue - cost  
	#Find the branches for which branch level real profit is more than the estimated_profit.
select * from bank_branch_pl;
select branch,estimated_profit,revenue-cost as real_profit from bank_branch_pl 
having real_profit>estimated_profit ;
-------------------------------------------------------------------------------------------------------------
# Question 8:
# 8) IF Real profit is calculated as : 		Real  Profit = revenue - cost  
	#Display the name of the branch its total estimated profit, real profit after ignoring the loss.
select branch,sum(estimated_profit),revenue-cost as real_profit from bank_branch_pl where revenue-cost>0;
-------------------------------------------------------------------------------------------------------------
# Question 9:
# 9)  Display the names of the product, banker and the branch that has incurred a loss. 
# Note : revenue - cost  is Loss if its value is -ve. 
select product,banker,branch from bank_branch_pl where revenue-cost<0;
-------------------------------------------------------------------------------------------------------------
# Question 10:
# 10)  Display the name of the branch and product that has earned the least profit.
select branch,product,sum(revenue-cost) as profit,estimated_profit from bank_branch_pl group by branch,product
having profit>=(0.9*estimated_profit);
-------------------------------------------------------------------------------------------------------------
# Question 11:
# 11)  Calculate the branch and product level total calculated profit where the calculated profit is more than the estimated profit after ignoring losses.
select branch,product from bank_branch_pl where revenue>cost group by branch,product
having sum(revenue-cost)>sum(estimated_profit);
--------------------------------------------------------------------------------------------------------------
# Question 12:
# 12)  Display the names of the products whose
# calculated profits are almost equal to the estimated profit with a minimum difference of 10%.
select * from bank_branch_pl;
select product from bank_branch_pl group by product 
having sum(estimated_profit)<1.1*sum(revenue-cost);
-------------------------------------------------------------------------------------------------------------
# Question 13:
# 13) Display the name of the branch and products 
#  whose calculated profit exceeds the estimated profit even if the cost of product is reduced by 30%.
 select branch,product from bank_branch_pl where revenue<cost group by branch,product 
 having sum(revenue-0.7*cost)>sum(estimated_profit);