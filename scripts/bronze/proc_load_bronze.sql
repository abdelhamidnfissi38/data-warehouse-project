BULK INSERT bronze.crm_cust_info
		FROM 'C:\Users\PC\Desktop\data-warehouse-project\datasets\source_crm\cust_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);