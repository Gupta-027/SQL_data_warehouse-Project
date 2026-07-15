create or alter procedure bronze.load_bronze 
as 
begin
declare @start_time Datetime , @end_time Datetime
begin try
print 'Loading Bronze Layer';
print '___________________';

print 'Loading CRM Table';
print '__________________';

set @start_time = getdate();
print'>>Truncating Data:bronze.crm_cust_info';
truncate table bronze.crm_cust_info;
print'>>Inserting data into :bronze.crm_cust_info';
bulk insert bronze.crm_cust_info
from 'C:\Projects\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
with (
firstrow =2 ,
fieldterminator = ',',
tablock
);


print'>>Truncating Data:bronze.crm_prd_info';
truncate table bronze.crm_prd_info;
print'>>Inserting data into :bronze.crm_prd_info';
bulk insert bronze.crm_prd_info
from 'C:\Projects\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
with (
firstrow =2 ,
fieldterminator = ',',
tablock
);

print'>>Truncating Data:crm_sales_details';
truncate table bronze.crm_sales_details;
print'>>Inserting data into :crm_sales_details';
bulk insert bronze.crm_sales_details
from 'C:\Projects\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
with (
firstrow =2 ,
fieldterminator = ',',
tablock
);

print 'Loading ERP Table';
print '__________________';

print'>>Truncating Data:bronze.erp_cust_az12';
truncate table bronze.erp_cust_az12;
print'>>Inserting data into :bronze.erp_cust_az12';
bulk insert bronze.erp_cust_az12
from 'C:\Projects\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
with (
firstrow =2 ,
fieldterminator = ',',
tablock
);

print'>>Truncating Data:bronze.erp_loc_a101';
truncate table bronze.erp_loc_a101;
print'>>Inserting data into :bronze.erp_loc_a101';
bulk insert bronze.erp_loc_a101
from 'C:\Projects\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
with (
firstrow =2 ,
fieldterminator = ',',
tablock
);

print'>>Truncating Data:bronze.erp_px_cat_g1v2';
truncate table bronze.erp_px_cat_g1v2;
print'>>Inserting data into :bronze.erp_px_cat_g1v2';
bulk insert bronze.erp_px_cat_g1v2
from 'C:\Projects\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
with (
firstrow =2 ,
fieldterminator = ',',
tablock
);
end try
begin catch 
	print '============================='
	print 'Error Occured During Loading Of The Bronze Layer'
	print '============================='

end catch
end
set @end_time = getdate();
print '>>Load Duration:' +  cast(datediff(second,@start_time , @end_time) AS nvarchar) + 'seconds';


 
