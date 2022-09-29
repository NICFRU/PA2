/*******************************************
***
***
*** Author:	Niclas Cramer
*** Date:	  23 Sep 2022 22:43:36
***
*** Source:	C:\Users\Niclas\Development\PA2\Tool_Niclas_23.06.2022 (1)\processed\BKPF 50 2021.txt_processed
*** Dest.:	[DU00545_Worx_SRC].import.BKPF 50 2021
***
*** Topic:	Automatically generated import script.
***
***
*******************************************/

use [DU00545_Worx_SRC]
go

/******************************************/
/*** Create import schema			    	    ***/
/******************************************/

IF NOT EXISTS(select 1 from INFORMATION_SCHEMA.SCHEMATA where SCHEMA_NAME = 'import')
BEGIN
    exec('create schema import')
END

/******************************************/
/*** Create table and insert data	    	***/
/******************************************/

IF OBJECT_ID('import.BKPF 50 2021','U') IS NOT NULL
drop table import.BKPF 50 2021
go

create table import.BKPF 50 2021(
      [CoCd] nvarchar(255)
     ,[DocumentNo] nvarchar(255)
     ,[Year] nvarchar(255)
     ,[Doc. Type] nvarchar(255)
     ,[Doc. Date] nvarchar(255)
     ,[Pstng Date] nvarchar(255)
     ,[Period] nvarchar(255)
     ,[Entry Dte] nvarchar(255)
     ,[Time] nvarchar(255)
     ,[Changed] nvarchar(255)
     ,[TranslDate] nvarchar(255)
     ,[User name] nvarchar(255)
     ,[TCode] nvarchar(255)
     ,[Cross-CC number] nvarchar(255)
     ,[Reference] nvarchar(255)
     ,[RecEnt doc] nvarchar(255)
     ,[Rev. with] nvarchar(255)
     ,[Year.1] nvarchar(255)
     ,[Document Header Text] nvarchar(255)
     ,[Crcy] nvarchar(255)
     ,[Exch.rate] nvarchar(255)
     ,[GrpCy] nvarchar(255)
     ,[Group exchange rate] nvarchar(255)
     ,[S] nvarchar(255)
     ,[Net document type] nvarchar(255)
     ,[I] nvarchar(255)
     ,[Tran] nvarchar(255)
     ,[Sess. Name] nvarchar(255)
     ,[Ref. Tran.] nvarchar(255)
     ,[Ref. Key] nvarchar(255)
     ,[LCurr] nvarchar(255)
     ,[Reversal flag] nvarchar(255)
     ,[Reversal date] nvarchar(255)
     ,[Calc.tax] nvarchar(255)
     ,[Log.System] nvarchar(255)
     ,[Reason] nvarchar(255)
)
go

--insert the data
BULK INSERT import.BKPF 50 2021
    FROM 'C:\Users\Niclas\Development\PA2\Tool_Niclas_23.06.2022 (1)\processed\BKPF 50 2021.txt_processed'
    WITH
    (
        FIRSTROW = 2,
        MAXERRORS = 0,			--no errors allowed
        FIELDTERMINATOR = '|',
        ROWTERMINATOR = '0x0D000A00',
        DATAFILETYPE = 'widechar',
        BATCHSIZE = 1000000
    )
go

/******************************************/
/*** Control totals / Quality checks	***/
/******************************************/

select COUNT(1) from import.BKPF 50 2021
--
--expected: "30411"

select top 10 * from import.BKPF 50 2021
--

--The next line checks for exact duplicates, can take a long time!
select count(1) from (select distinct * from import.BKPF 50 2021) temp
--

--Remember to check the primary key! Sorry, the script didn't know the primary key
select distinct [KEY_COLUMNS] from import.BKPF 50 2021
--

select distinct top 20 ltrim(rtrim([CoCd])) from import.BKPF 50 2021         --
select distinct top 20 ltrim(rtrim([DocumentNo])) from import.BKPF 50 2021         --
select distinct top 20 ltrim(rtrim([Year])) from import.BKPF 50 2021         --
select distinct top 20 ltrim(rtrim([Doc. Type])) from import.BKPF 50 2021         --
select distinct top 20 ltrim(rtrim([Doc. Date])) from import.BKPF 50 2021         --
select distinct top 20 ltrim(rtrim([Pstng Date])) from import.BKPF 50 2021         --
select distinct top 20 ltrim(rtrim([Period])) from import.BKPF 50 2021         --
select distinct top 20 ltrim(rtrim([Entry Dte])) from import.BKPF 50 2021         --
select distinct top 20 ltrim(rtrim([Time])) from import.BKPF 50 2021         --
select distinct top 20 ltrim(rtrim([Changed])) from import.BKPF 50 2021         --
select distinct top 20 ltrim(rtrim([TranslDate])) from import.BKPF 50 2021         --
select distinct top 20 ltrim(rtrim([User name])) from import.BKPF 50 2021         --
select distinct top 20 ltrim(rtrim([TCode])) from import.BKPF 50 2021         --
select distinct top 20 ltrim(rtrim([Cross-CC number])) from import.BKPF 50 2021         --
select distinct top 20 ltrim(rtrim([Reference])) from import.BKPF 50 2021         --
select distinct top 20 ltrim(rtrim([RecEnt doc])) from import.BKPF 50 2021         --
select distinct top 20 ltrim(rtrim([Rev. with])) from import.BKPF 50 2021         --
select distinct top 20 ltrim(rtrim([Year.1])) from import.BKPF 50 2021         --
select distinct top 20 ltrim(rtrim([Document Header Text])) from import.BKPF 50 2021         --
select distinct top 20 ltrim(rtrim([Crcy])) from import.BKPF 50 2021         --
select distinct top 20 ltrim(rtrim([Exch.rate])) from import.BKPF 50 2021         --
select distinct top 20 ltrim(rtrim([GrpCy])) from import.BKPF 50 2021         --
select distinct top 20 ltrim(rtrim([Group exchange rate])) from import.BKPF 50 2021         --
select distinct top 20 ltrim(rtrim([S])) from import.BKPF 50 2021         --
select distinct top 20 ltrim(rtrim([Net document type])) from import.BKPF 50 2021         --
select distinct top 20 ltrim(rtrim([I])) from import.BKPF 50 2021         --
select distinct top 20 ltrim(rtrim([Tran])) from import.BKPF 50 2021         --
select distinct top 20 ltrim(rtrim([Sess. Name])) from import.BKPF 50 2021         --
select distinct top 20 ltrim(rtrim([Ref. Tran.])) from import.BKPF 50 2021         --
select distinct top 20 ltrim(rtrim([Ref. Key])) from import.BKPF 50 2021         --
select distinct top 20 ltrim(rtrim([LCurr])) from import.BKPF 50 2021         --
select distinct top 20 ltrim(rtrim([Reversal flag])) from import.BKPF 50 2021         --
select distinct top 20 ltrim(rtrim([Reversal date])) from import.BKPF 50 2021         --
select distinct top 20 ltrim(rtrim([Calc.tax])) from import.BKPF 50 2021         --
select distinct top 20 ltrim(rtrim([Log.System])) from import.BKPF 50 2021         --
select distinct top 20 ltrim(rtrim([Reason])) from import.BKPF 50 2021         --



/******************************************/
/*** Create prepare schema				***/
/******************************************/

IF NOT EXISTS(select 1 from INFORMATION_SCHEMA.SCHEMATA where SCHEMA_NAME = 'transform')
BEGIN
	exec('create schema transform')
END

/******************************************/
/*** Prepare the data					***/
/******************************************/

IF OBJECT_ID('transform.BKPF 50 2021','U') IS NOT NULL
drop table transform.BKPF 50 2021
go

select
	   ltrim(rtrim([CoCd])) as [CoCd]
	  ,ltrim(rtrim([DocumentNo])) as [DocumentNo]
	  ,ltrim(rtrim([Year])) as [Year]
	  ,ltrim(rtrim([Doc. Type])) as [Doc. Type]
	  ,ltrim(rtrim([Doc. Date])) as [Doc. Date]
	  ,ltrim(rtrim([Pstng Date])) as [Pstng Date]
	  ,ltrim(rtrim([Period])) as [Period]
	  ,ltrim(rtrim([Entry Dte])) as [Entry Dte]
	  ,ltrim(rtrim([Time])) as [Time]
	  ,ltrim(rtrim([Changed])) as [Changed]
	  ,ltrim(rtrim([TranslDate])) as [TranslDate]
	  ,ltrim(rtrim([User name])) as [User name]
	  ,ltrim(rtrim([TCode])) as [TCode]
	  ,ltrim(rtrim([Cross-CC number])) as [Cross-CC number]
	  ,ltrim(rtrim([Reference])) as [Reference]
	  ,ltrim(rtrim([RecEnt doc])) as [RecEnt doc]
	  ,ltrim(rtrim([Rev. with])) as [Rev. with]
	  ,ltrim(rtrim([Year.1])) as [Year.1]
	  ,ltrim(rtrim([Document Header Text])) as [Document Header Text]
	  ,ltrim(rtrim([Crcy])) as [Crcy]
	  ,ltrim(rtrim([Exch.rate])) as [Exch.rate]
	  ,ltrim(rtrim([GrpCy])) as [GrpCy]
	  ,ltrim(rtrim([Group exchange rate])) as [Group exchange rate]
	  ,ltrim(rtrim([S])) as [S]
	  ,ltrim(rtrim([Net document type])) as [Net document type]
	  ,ltrim(rtrim([I])) as [I]
	  ,ltrim(rtrim([Tran])) as [Tran]
	  ,ltrim(rtrim([Sess. Name])) as [Sess. Name]
	  ,ltrim(rtrim([Ref. Tran.])) as [Ref. Tran.]
	  ,ltrim(rtrim([Ref. Key])) as [Ref. Key]
	  ,ltrim(rtrim([LCurr])) as [LCurr]
	  ,ltrim(rtrim([Reversal flag])) as [Reversal flag]
	  ,ltrim(rtrim([Reversal date])) as [Reversal date]
	  ,ltrim(rtrim([Calc.tax])) as [Calc.tax]
	  ,ltrim(rtrim([Log.System])) as [Log.System]
	  ,ltrim(rtrim([Reason])) as [Reason]

    into transform.BKPF 50 2021
    from import.BKPF 50 2021
go

select count(1) from transform.BKPF 50 2021
--

select top 10 * from transform.BKPF 50 2021
--

