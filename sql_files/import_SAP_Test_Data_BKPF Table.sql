/*******************************************
***
***
*** Author:	Niclas Cramer
*** Date:	  29 Oct 2022 14:12:45
***
*** Source:	C:\Users\Niclas\Development\PA2\Tool_Niclas_23.06.2022 (1)\processed\SAP_Test_Data_BKPF Table.txt_processed
*** Dest.:	[DU00545_Worx_SRC].import.SAP_Test_Data_BKPF Table
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

IF OBJECT_ID('import.SAP_Test_Data_BKPF Table','U') IS NOT NULL
drop table import.SAP_Test_Data_BKPF Table
go

create table import.SAP_Test_Data_BKPF Table(
      [Buchungskreis] nvarchar(255)
     ,[Belegnummer] nvarchar(255)
     ,[Geschäftsjahr] nvarchar(255)
     ,[Belegart] nvarchar(255)
     ,[Belegdatum] nvarchar(255)
     ,[Buchungsdatum] nvarchar(255)
     ,[Buchungsperiode] nvarchar(255)
     ,[Erfassungsdatum] nvarchar(255)
     ,[Erfassungsuhrzeit] nvarchar(255)
     ,[Geändert am] nvarchar(255)
     ,[Letzte Fortschreib] nvarchar(255)
     ,[Umrechnungsdatum] nvarchar(255)
     ,[Transaktionscode] nvarchar(255)
     ,[Übergreifende Nr] nvarchar(255)
     ,[Referenz] nvarchar(255)
     ,[Jahr] nvarchar(255)
     ,[Belegkopftext] nvarchar(255)
     ,[Währung] nvarchar(255)
     ,[Umrechnungskurs] nvarchar(255)
     ,[Konzernwährung] nvarchar(255)
     ,[Konzernkurs] nvarchar(255)
     ,[Belegstatus] nvarchar(255)
     ,[Dokumentenname im Archivsystem] nvarchar(255)
)
go

--insert the data
BULK INSERT import.SAP_Test_Data_BKPF Table
    FROM 'C:\Users\Niclas\Development\PA2\Tool_Niclas_23.06.2022 (1)\processed\SAP_Test_Data_BKPF Table.txt_processed'
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

select COUNT(1) from import.SAP_Test_Data_BKPF Table
--
--expected: "2500"

select top 10 * from import.SAP_Test_Data_BKPF Table
--

--The next line checks for exact duplicates, can take a long time!
select count(1) from (select distinct * from import.SAP_Test_Data_BKPF Table) temp
--

--Remember to check the primary key! Sorry, the script didn't know the primary key
select distinct [KEY_COLUMNS] from import.SAP_Test_Data_BKPF Table
--

select distinct top 20 ltrim(rtrim([Buchungskreis])) from import.SAP_Test_Data_BKPF Table         --
select distinct top 20 ltrim(rtrim([Belegnummer])) from import.SAP_Test_Data_BKPF Table         --
select distinct top 20 ltrim(rtrim([Geschäftsjahr])) from import.SAP_Test_Data_BKPF Table         --
select distinct top 20 ltrim(rtrim([Belegart])) from import.SAP_Test_Data_BKPF Table         --
select distinct top 20 ltrim(rtrim([Belegdatum])) from import.SAP_Test_Data_BKPF Table         --
select distinct top 20 ltrim(rtrim([Buchungsdatum])) from import.SAP_Test_Data_BKPF Table         --
select distinct top 20 ltrim(rtrim([Buchungsperiode])) from import.SAP_Test_Data_BKPF Table         --
select distinct top 20 ltrim(rtrim([Erfassungsdatum])) from import.SAP_Test_Data_BKPF Table         --
select distinct top 20 ltrim(rtrim([Erfassungsuhrzeit])) from import.SAP_Test_Data_BKPF Table         --
select distinct top 20 ltrim(rtrim([Geändert am])) from import.SAP_Test_Data_BKPF Table         --
select distinct top 20 ltrim(rtrim([Letzte Fortschreib])) from import.SAP_Test_Data_BKPF Table         --
select distinct top 20 ltrim(rtrim([Umrechnungsdatum])) from import.SAP_Test_Data_BKPF Table         --
select distinct top 20 ltrim(rtrim([Transaktionscode])) from import.SAP_Test_Data_BKPF Table         --
select distinct top 20 ltrim(rtrim([Übergreifende Nr])) from import.SAP_Test_Data_BKPF Table         --
select distinct top 20 ltrim(rtrim([Referenz])) from import.SAP_Test_Data_BKPF Table         --
select distinct top 20 ltrim(rtrim([Jahr])) from import.SAP_Test_Data_BKPF Table         --
select distinct top 20 ltrim(rtrim([Belegkopftext])) from import.SAP_Test_Data_BKPF Table         --
select distinct top 20 ltrim(rtrim([Währung])) from import.SAP_Test_Data_BKPF Table         --
select distinct top 20 ltrim(rtrim([Umrechnungskurs])) from import.SAP_Test_Data_BKPF Table         --
select distinct top 20 ltrim(rtrim([Konzernwährung])) from import.SAP_Test_Data_BKPF Table         --
select distinct top 20 ltrim(rtrim([Konzernkurs])) from import.SAP_Test_Data_BKPF Table         --
select distinct top 20 ltrim(rtrim([Belegstatus])) from import.SAP_Test_Data_BKPF Table         --
select distinct top 20 ltrim(rtrim([Dokumentenname im Archivsystem])) from import.SAP_Test_Data_BKPF Table         --



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

IF OBJECT_ID('transform.SAP_Test_Data_BKPF Table','U') IS NOT NULL
drop table transform.SAP_Test_Data_BKPF Table
go

select
	   ltrim(rtrim([Buchungskreis])) as [Buchungskreis]
	  ,ltrim(rtrim([Belegnummer])) as [Belegnummer]
	  ,ltrim(rtrim([Geschäftsjahr])) as [Geschäftsjahr]
	  ,ltrim(rtrim([Belegart])) as [Belegart]
	  ,ltrim(rtrim([Belegdatum])) as [Belegdatum]
	  ,ltrim(rtrim([Buchungsdatum])) as [Buchungsdatum]
	  ,ltrim(rtrim([Buchungsperiode])) as [Buchungsperiode]
	  ,ltrim(rtrim([Erfassungsdatum])) as [Erfassungsdatum]
	  ,ltrim(rtrim([Erfassungsuhrzeit])) as [Erfassungsuhrzeit]
	  ,ltrim(rtrim([Geändert am])) as [Geändert am]
	  ,ltrim(rtrim([Letzte Fortschreib])) as [Letzte Fortschreib]
	  ,ltrim(rtrim([Umrechnungsdatum])) as [Umrechnungsdatum]
	  ,ltrim(rtrim([Transaktionscode])) as [Transaktionscode]
	  ,ltrim(rtrim([Übergreifende Nr])) as [Übergreifende Nr]
	  ,ltrim(rtrim([Referenz])) as [Referenz]
	  ,ltrim(rtrim([Jahr])) as [Jahr]
	  ,ltrim(rtrim([Belegkopftext])) as [Belegkopftext]
	  ,ltrim(rtrim([Währung])) as [Währung]
	  ,ltrim(rtrim([Umrechnungskurs])) as [Umrechnungskurs]
	  ,ltrim(rtrim([Konzernwährung])) as [Konzernwährung]
	  ,ltrim(rtrim([Konzernkurs])) as [Konzernkurs]
	  ,ltrim(rtrim([Belegstatus])) as [Belegstatus]
	  ,ltrim(rtrim([Dokumentenname im Archivsystem])) as [Dokumentenname im Archivsystem]

    into transform.SAP_Test_Data_BKPF Table
    from import.SAP_Test_Data_BKPF Table
go

select count(1) from transform.SAP_Test_Data_BKPF Table
--

select top 10 * from transform.SAP_Test_Data_BKPF Table
--

