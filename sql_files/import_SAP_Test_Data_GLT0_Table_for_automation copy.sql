/*******************************************
***
***
*** Author:	Niclas Cramer
*** Date:	  29 Oct 2022 14:12:52
***
*** Source:	C:\Users\Niclas\Development\PA2\Tool_Niclas_23.06.2022 (1)\processed\SAP_Test_Data_GLT0_Table_for_automation copy.txt_processed
*** Dest.:	[DU00545_Worx_SRC].import.SAP_Test_Data_GLT0_Table_for_automation copy
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

IF OBJECT_ID('import.SAP_Test_Data_GLT0_Table_for_automation copy','U') IS NOT NULL
drop table import.SAP_Test_Data_GLT0_Table_for_automation copy
go

create table import.SAP_Test_Data_GLT0_Table_for_automation copy(
      [Ledger] nvarchar(255)
     ,[Satzart] nvarchar(255)
     ,[Version] nvarchar(255)
     ,[Buchungskreis] nvarchar(255)
     ,[Geschäftsjahr] nvarchar(255)
     ,[Kontonummer] nvarchar(255)
     ,[Geschäftsbereich] nvarchar(255)
     ,[Transaktionswährg.] nvarchar(255)
     ,[Soll/Haben-Kennz.] nvarchar(255)
     ,[Periode] nvarchar(255)
     ,[TransWähr. (Vortrag)] nvarchar(255)
     ,[Transaktionswährg..1] nvarchar(255)
     ,[Transaktionswährg..2] nvarchar(255)
     ,[Transaktionswährg..3] nvarchar(255)
     ,[Transaktionswährg..4] nvarchar(255)
     ,[Transaktionswährg..5] nvarchar(255)
     ,[Transaktionswährg..6] nvarchar(255)
     ,[Transaktionswährg..7] nvarchar(255)
     ,[Transaktionswährg..8] nvarchar(255)
     ,[Transaktionswährg..9] nvarchar(255)
     ,[Transaktionswährg..10] nvarchar(255)
     ,[Transaktionswährg..11] nvarchar(255)
     ,[Transaktionswährg..12] nvarchar(255)
     ,[Transaktionswährg..13] nvarchar(255)
     ,[Transaktionswährg..14] nvarchar(255)
     ,[Transaktionswährg..15] nvarchar(255)
     ,[Transaktionswährg..16] nvarchar(255)
     ,[Hauswährung] nvarchar(255)
     ,[Summe der Bewegungen der Periode in Haus] nvarchar(255)
     ,[Summe der Bewegungen der Periode in Haus.1] nvarchar(255)
     ,[Summe der Bewegungen der Periode in Haus.2] nvarchar(255)
     ,[Summe der Bewegungen der Periode in Haus.3] nvarchar(255)
     ,[Summe der Bewegungen der Periode in Haus.4] nvarchar(255)
     ,[Summe der Bewegungen der Periode in Haus.5] nvarchar(255)
     ,[Summe der Bewegungen der Periode in Haus.6] nvarchar(255)
     ,[Summe der Bewegungen der Periode in Haus.7] nvarchar(255)
     ,[Summe der Bewegungen der Periode in Haus.8] nvarchar(255)
     ,[Summe der Bewegungen der Periode in Haus.9] nvarchar(255)
     ,[Summe der Bewegungen der Periode in Haus.10] nvarchar(255)
     ,[Summe der Bewegungen der Periode in Haus.11] nvarchar(255)
     ,[Summe der Bewegungen der Periode in Haus.12] nvarchar(255)
     ,[Summe der Bewegungen der Periode in Haus.13] nvarchar(255)
     ,[Summe der Bewegungen der Periode in Haus.14] nvarchar(255)
     ,[Summe der Bewegungen der Periode in Haus.15] nvarchar(255)
     ,[Verteilungschlüssel Währung] nvarchar(255)
     ,[Konzernwährung] nvarchar(255)
     ,[Betrag] nvarchar(255)
     ,[Betrag.1] nvarchar(255)
     ,[Betrag.2] nvarchar(255)
     ,[Betrag.3] nvarchar(255)
     ,[Betrag.4] nvarchar(255)
     ,[Betrag.5] nvarchar(255)
     ,[Betrag.6] nvarchar(255)
     ,[Betrag.7] nvarchar(255)
     ,[Betrag.8] nvarchar(255)
     ,[Betrag.9] nvarchar(255)
     ,[Betrag.10] nvarchar(255)
     ,[Betrag.11] nvarchar(255)
     ,[Betrag.12] nvarchar(255)
     ,[Betrag.13] nvarchar(255)
     ,[Betrag.14] nvarchar(255)
     ,[Betrag.15] nvarchar(255)
)
go

--insert the data
BULK INSERT import.SAP_Test_Data_GLT0_Table_for_automation copy
    FROM 'C:\Users\Niclas\Development\PA2\Tool_Niclas_23.06.2022 (1)\processed\SAP_Test_Data_GLT0_Table_for_automation copy.txt_processed'
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

select COUNT(1) from import.SAP_Test_Data_GLT0_Table_for_automation copy
--
--expected: "99"

select top 10 * from import.SAP_Test_Data_GLT0_Table_for_automation copy
--

--The next line checks for exact duplicates, can take a long time!
select count(1) from (select distinct * from import.SAP_Test_Data_GLT0_Table_for_automation copy) temp
--

--Remember to check the primary key! Sorry, the script didn't know the primary key
select distinct [KEY_COLUMNS] from import.SAP_Test_Data_GLT0_Table_for_automation copy
--

select distinct top 20 ltrim(rtrim([Ledger])) from import.SAP_Test_Data_GLT0_Table_for_automation copy         --
select distinct top 20 ltrim(rtrim([Satzart])) from import.SAP_Test_Data_GLT0_Table_for_automation copy         --
select distinct top 20 ltrim(rtrim([Version])) from import.SAP_Test_Data_GLT0_Table_for_automation copy         --
select distinct top 20 ltrim(rtrim([Buchungskreis])) from import.SAP_Test_Data_GLT0_Table_for_automation copy         --
select distinct top 20 ltrim(rtrim([Geschäftsjahr])) from import.SAP_Test_Data_GLT0_Table_for_automation copy         --
select distinct top 20 ltrim(rtrim([Kontonummer])) from import.SAP_Test_Data_GLT0_Table_for_automation copy         --
select distinct top 20 ltrim(rtrim([Geschäftsbereich])) from import.SAP_Test_Data_GLT0_Table_for_automation copy         --
select distinct top 20 ltrim(rtrim([Transaktionswährg.])) from import.SAP_Test_Data_GLT0_Table_for_automation copy         --
select distinct top 20 ltrim(rtrim([Soll/Haben-Kennz.])) from import.SAP_Test_Data_GLT0_Table_for_automation copy         --
select distinct top 20 ltrim(rtrim([Periode])) from import.SAP_Test_Data_GLT0_Table_for_automation copy         --
select distinct top 20 ltrim(rtrim([TransWähr. (Vortrag)])) from import.SAP_Test_Data_GLT0_Table_for_automation copy         --
select distinct top 20 ltrim(rtrim([Transaktionswährg..1])) from import.SAP_Test_Data_GLT0_Table_for_automation copy         --
select distinct top 20 ltrim(rtrim([Transaktionswährg..2])) from import.SAP_Test_Data_GLT0_Table_for_automation copy         --
select distinct top 20 ltrim(rtrim([Transaktionswährg..3])) from import.SAP_Test_Data_GLT0_Table_for_automation copy         --
select distinct top 20 ltrim(rtrim([Transaktionswährg..4])) from import.SAP_Test_Data_GLT0_Table_for_automation copy         --
select distinct top 20 ltrim(rtrim([Transaktionswährg..5])) from import.SAP_Test_Data_GLT0_Table_for_automation copy         --
select distinct top 20 ltrim(rtrim([Transaktionswährg..6])) from import.SAP_Test_Data_GLT0_Table_for_automation copy         --
select distinct top 20 ltrim(rtrim([Transaktionswährg..7])) from import.SAP_Test_Data_GLT0_Table_for_automation copy         --
select distinct top 20 ltrim(rtrim([Transaktionswährg..8])) from import.SAP_Test_Data_GLT0_Table_for_automation copy         --
select distinct top 20 ltrim(rtrim([Transaktionswährg..9])) from import.SAP_Test_Data_GLT0_Table_for_automation copy         --
select distinct top 20 ltrim(rtrim([Transaktionswährg..10])) from import.SAP_Test_Data_GLT0_Table_for_automation copy         --
select distinct top 20 ltrim(rtrim([Transaktionswährg..11])) from import.SAP_Test_Data_GLT0_Table_for_automation copy         --
select distinct top 20 ltrim(rtrim([Transaktionswährg..12])) from import.SAP_Test_Data_GLT0_Table_for_automation copy         --
select distinct top 20 ltrim(rtrim([Transaktionswährg..13])) from import.SAP_Test_Data_GLT0_Table_for_automation copy         --
select distinct top 20 ltrim(rtrim([Transaktionswährg..14])) from import.SAP_Test_Data_GLT0_Table_for_automation copy         --
select distinct top 20 ltrim(rtrim([Transaktionswährg..15])) from import.SAP_Test_Data_GLT0_Table_for_automation copy         --
select distinct top 20 ltrim(rtrim([Transaktionswährg..16])) from import.SAP_Test_Data_GLT0_Table_for_automation copy         --
select distinct top 20 ltrim(rtrim([Hauswährung])) from import.SAP_Test_Data_GLT0_Table_for_automation copy         --
select distinct top 20 ltrim(rtrim([Summe der Bewegungen der Periode in Haus])) from import.SAP_Test_Data_GLT0_Table_for_automation copy         --
select distinct top 20 ltrim(rtrim([Summe der Bewegungen der Periode in Haus.1])) from import.SAP_Test_Data_GLT0_Table_for_automation copy         --
select distinct top 20 ltrim(rtrim([Summe der Bewegungen der Periode in Haus.2])) from import.SAP_Test_Data_GLT0_Table_for_automation copy         --
select distinct top 20 ltrim(rtrim([Summe der Bewegungen der Periode in Haus.3])) from import.SAP_Test_Data_GLT0_Table_for_automation copy         --
select distinct top 20 ltrim(rtrim([Summe der Bewegungen der Periode in Haus.4])) from import.SAP_Test_Data_GLT0_Table_for_automation copy         --
select distinct top 20 ltrim(rtrim([Summe der Bewegungen der Periode in Haus.5])) from import.SAP_Test_Data_GLT0_Table_for_automation copy         --
select distinct top 20 ltrim(rtrim([Summe der Bewegungen der Periode in Haus.6])) from import.SAP_Test_Data_GLT0_Table_for_automation copy         --
select distinct top 20 ltrim(rtrim([Summe der Bewegungen der Periode in Haus.7])) from import.SAP_Test_Data_GLT0_Table_for_automation copy         --
select distinct top 20 ltrim(rtrim([Summe der Bewegungen der Periode in Haus.8])) from import.SAP_Test_Data_GLT0_Table_for_automation copy         --
select distinct top 20 ltrim(rtrim([Summe der Bewegungen der Periode in Haus.9])) from import.SAP_Test_Data_GLT0_Table_for_automation copy         --
select distinct top 20 ltrim(rtrim([Summe der Bewegungen der Periode in Haus.10])) from import.SAP_Test_Data_GLT0_Table_for_automation copy         --
select distinct top 20 ltrim(rtrim([Summe der Bewegungen der Periode in Haus.11])) from import.SAP_Test_Data_GLT0_Table_for_automation copy         --
select distinct top 20 ltrim(rtrim([Summe der Bewegungen der Periode in Haus.12])) from import.SAP_Test_Data_GLT0_Table_for_automation copy         --
select distinct top 20 ltrim(rtrim([Summe der Bewegungen der Periode in Haus.13])) from import.SAP_Test_Data_GLT0_Table_for_automation copy         --
select distinct top 20 ltrim(rtrim([Summe der Bewegungen der Periode in Haus.14])) from import.SAP_Test_Data_GLT0_Table_for_automation copy         --
select distinct top 20 ltrim(rtrim([Summe der Bewegungen der Periode in Haus.15])) from import.SAP_Test_Data_GLT0_Table_for_automation copy         --
select distinct top 20 ltrim(rtrim([Verteilungschlüssel Währung])) from import.SAP_Test_Data_GLT0_Table_for_automation copy         --
select distinct top 20 ltrim(rtrim([Konzernwährung])) from import.SAP_Test_Data_GLT0_Table_for_automation copy         --
select distinct top 20 ltrim(rtrim([Betrag])) from import.SAP_Test_Data_GLT0_Table_for_automation copy         --
select distinct top 20 ltrim(rtrim([Betrag.1])) from import.SAP_Test_Data_GLT0_Table_for_automation copy         --
select distinct top 20 ltrim(rtrim([Betrag.2])) from import.SAP_Test_Data_GLT0_Table_for_automation copy         --
select distinct top 20 ltrim(rtrim([Betrag.3])) from import.SAP_Test_Data_GLT0_Table_for_automation copy         --
select distinct top 20 ltrim(rtrim([Betrag.4])) from import.SAP_Test_Data_GLT0_Table_for_automation copy         --
select distinct top 20 ltrim(rtrim([Betrag.5])) from import.SAP_Test_Data_GLT0_Table_for_automation copy         --
select distinct top 20 ltrim(rtrim([Betrag.6])) from import.SAP_Test_Data_GLT0_Table_for_automation copy         --
select distinct top 20 ltrim(rtrim([Betrag.7])) from import.SAP_Test_Data_GLT0_Table_for_automation copy         --
select distinct top 20 ltrim(rtrim([Betrag.8])) from import.SAP_Test_Data_GLT0_Table_for_automation copy         --
select distinct top 20 ltrim(rtrim([Betrag.9])) from import.SAP_Test_Data_GLT0_Table_for_automation copy         --
select distinct top 20 ltrim(rtrim([Betrag.10])) from import.SAP_Test_Data_GLT0_Table_for_automation copy         --
select distinct top 20 ltrim(rtrim([Betrag.11])) from import.SAP_Test_Data_GLT0_Table_for_automation copy         --
select distinct top 20 ltrim(rtrim([Betrag.12])) from import.SAP_Test_Data_GLT0_Table_for_automation copy         --
select distinct top 20 ltrim(rtrim([Betrag.13])) from import.SAP_Test_Data_GLT0_Table_for_automation copy         --
select distinct top 20 ltrim(rtrim([Betrag.14])) from import.SAP_Test_Data_GLT0_Table_for_automation copy         --
select distinct top 20 ltrim(rtrim([Betrag.15])) from import.SAP_Test_Data_GLT0_Table_for_automation copy         --



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

IF OBJECT_ID('transform.SAP_Test_Data_GLT0_Table_for_automation copy','U') IS NOT NULL
drop table transform.SAP_Test_Data_GLT0_Table_for_automation copy
go

select
	   ltrim(rtrim([Ledger])) as [Ledger]
	  ,ltrim(rtrim([Satzart])) as [Satzart]
	  ,ltrim(rtrim([Version])) as [Version]
	  ,ltrim(rtrim([Buchungskreis])) as [Buchungskreis]
	  ,ltrim(rtrim([Geschäftsjahr])) as [Geschäftsjahr]
	  ,ltrim(rtrim([Kontonummer])) as [Kontonummer]
	  ,ltrim(rtrim([Geschäftsbereich])) as [Geschäftsbereich]
	  ,ltrim(rtrim([Transaktionswährg.])) as [Transaktionswährg.]
	  ,ltrim(rtrim([Soll/Haben-Kennz.])) as [Soll/Haben-Kennz.]
	  ,ltrim(rtrim([Periode])) as [Periode]
	  ,ltrim(rtrim([TransWähr. (Vortrag)])) as [TransWähr. (Vortrag)]
	  ,ltrim(rtrim([Transaktionswährg..1])) as [Transaktionswährg..1]
	  ,ltrim(rtrim([Transaktionswährg..2])) as [Transaktionswährg..2]
	  ,ltrim(rtrim([Transaktionswährg..3])) as [Transaktionswährg..3]
	  ,ltrim(rtrim([Transaktionswährg..4])) as [Transaktionswährg..4]
	  ,ltrim(rtrim([Transaktionswährg..5])) as [Transaktionswährg..5]
	  ,ltrim(rtrim([Transaktionswährg..6])) as [Transaktionswährg..6]
	  ,ltrim(rtrim([Transaktionswährg..7])) as [Transaktionswährg..7]
	  ,ltrim(rtrim([Transaktionswährg..8])) as [Transaktionswährg..8]
	  ,ltrim(rtrim([Transaktionswährg..9])) as [Transaktionswährg..9]
	  ,ltrim(rtrim([Transaktionswährg..10])) as [Transaktionswährg..10]
	  ,ltrim(rtrim([Transaktionswährg..11])) as [Transaktionswährg..11]
	  ,ltrim(rtrim([Transaktionswährg..12])) as [Transaktionswährg..12]
	  ,ltrim(rtrim([Transaktionswährg..13])) as [Transaktionswährg..13]
	  ,ltrim(rtrim([Transaktionswährg..14])) as [Transaktionswährg..14]
	  ,ltrim(rtrim([Transaktionswährg..15])) as [Transaktionswährg..15]
	  ,ltrim(rtrim([Transaktionswährg..16])) as [Transaktionswährg..16]
	  ,ltrim(rtrim([Hauswährung])) as [Hauswährung]
	  ,ltrim(rtrim([Summe der Bewegungen der Periode in Haus])) as [Summe der Bewegungen der Periode in Haus]
	  ,ltrim(rtrim([Summe der Bewegungen der Periode in Haus.1])) as [Summe der Bewegungen der Periode in Haus.1]
	  ,ltrim(rtrim([Summe der Bewegungen der Periode in Haus.2])) as [Summe der Bewegungen der Periode in Haus.2]
	  ,ltrim(rtrim([Summe der Bewegungen der Periode in Haus.3])) as [Summe der Bewegungen der Periode in Haus.3]
	  ,ltrim(rtrim([Summe der Bewegungen der Periode in Haus.4])) as [Summe der Bewegungen der Periode in Haus.4]
	  ,ltrim(rtrim([Summe der Bewegungen der Periode in Haus.5])) as [Summe der Bewegungen der Periode in Haus.5]
	  ,ltrim(rtrim([Summe der Bewegungen der Periode in Haus.6])) as [Summe der Bewegungen der Periode in Haus.6]
	  ,ltrim(rtrim([Summe der Bewegungen der Periode in Haus.7])) as [Summe der Bewegungen der Periode in Haus.7]
	  ,ltrim(rtrim([Summe der Bewegungen der Periode in Haus.8])) as [Summe der Bewegungen der Periode in Haus.8]
	  ,ltrim(rtrim([Summe der Bewegungen der Periode in Haus.9])) as [Summe der Bewegungen der Periode in Haus.9]
	  ,ltrim(rtrim([Summe der Bewegungen der Periode in Haus.10])) as [Summe der Bewegungen der Periode in Haus.10]
	  ,ltrim(rtrim([Summe der Bewegungen der Periode in Haus.11])) as [Summe der Bewegungen der Periode in Haus.11]
	  ,ltrim(rtrim([Summe der Bewegungen der Periode in Haus.12])) as [Summe der Bewegungen der Periode in Haus.12]
	  ,ltrim(rtrim([Summe der Bewegungen der Periode in Haus.13])) as [Summe der Bewegungen der Periode in Haus.13]
	  ,ltrim(rtrim([Summe der Bewegungen der Periode in Haus.14])) as [Summe der Bewegungen der Periode in Haus.14]
	  ,ltrim(rtrim([Summe der Bewegungen der Periode in Haus.15])) as [Summe der Bewegungen der Periode in Haus.15]
	  ,ltrim(rtrim([Verteilungschlüssel Währung])) as [Verteilungschlüssel Währung]
	  ,ltrim(rtrim([Konzernwährung])) as [Konzernwährung]
	  ,ltrim(rtrim([Betrag])) as [Betrag]
	  ,ltrim(rtrim([Betrag.1])) as [Betrag.1]
	  ,ltrim(rtrim([Betrag.2])) as [Betrag.2]
	  ,ltrim(rtrim([Betrag.3])) as [Betrag.3]
	  ,ltrim(rtrim([Betrag.4])) as [Betrag.4]
	  ,ltrim(rtrim([Betrag.5])) as [Betrag.5]
	  ,ltrim(rtrim([Betrag.6])) as [Betrag.6]
	  ,ltrim(rtrim([Betrag.7])) as [Betrag.7]
	  ,ltrim(rtrim([Betrag.8])) as [Betrag.8]
	  ,ltrim(rtrim([Betrag.9])) as [Betrag.9]
	  ,ltrim(rtrim([Betrag.10])) as [Betrag.10]
	  ,ltrim(rtrim([Betrag.11])) as [Betrag.11]
	  ,ltrim(rtrim([Betrag.12])) as [Betrag.12]
	  ,ltrim(rtrim([Betrag.13])) as [Betrag.13]
	  ,ltrim(rtrim([Betrag.14])) as [Betrag.14]
	  ,ltrim(rtrim([Betrag.15])) as [Betrag.15]

    into transform.SAP_Test_Data_GLT0_Table_for_automation copy
    from import.SAP_Test_Data_GLT0_Table_for_automation copy
go

select count(1) from transform.SAP_Test_Data_GLT0_Table_for_automation copy
--

select top 10 * from transform.SAP_Test_Data_GLT0_Table_for_automation copy
--

