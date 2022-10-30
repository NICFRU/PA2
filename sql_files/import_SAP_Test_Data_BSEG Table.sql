/*******************************************
***
***
*** Author:	Niclas Cramer
*** Date:	  29 Oct 2022 14:12:52
***
*** Source:	C:\Users\Niclas\Development\PA2\Tool_Niclas_23.06.2022 (1)\processed\SAP_Test_Data_BSEG Table.txt_processed
*** Dest.:	[DU00545_Worx_SRC].import.SAP_Test_Data_BSEG Table
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

IF OBJECT_ID('import.SAP_Test_Data_BSEG Table','U') IS NOT NULL
drop table import.SAP_Test_Data_BSEG Table
go

create table import.SAP_Test_Data_BSEG Table(
      [Buchungskreis] nvarchar(255)
     ,[Belegnummer] nvarchar(255)
     ,[Geschäftsjahr] nvarchar(255)
     ,[Position] nvarchar(255)
     ,[Buchungszeilen-Id] nvarchar(255)
     ,[Ausgleichsdatum] nvarchar(255)
     ,[Erf.Dat.  Ausgleich] nvarchar(255)
     ,[Ausgleichsbeleg] nvarchar(255)
     ,[Buchungsschlüssel] nvarchar(255)
     ,[Kontoart] nvarchar(255)
     ,[Sonderhauptb.Kennz.] nvarchar(255)
     ,[Vorgangsklasse SHB] nvarchar(255)
     ,[Ziel-Sonderhb.Kz.] nvarchar(255)
     ,[Soll/Haben-Kennz.] nvarchar(255)
     ,[Geschäftsbereich] nvarchar(255)
     ,[PartnerGsber] nvarchar(255)
     ,[Steuerkennzeichen] nvarchar(255)
     ,[Quellsteuerkennz.] nvarchar(255)
     ,[Betrag Hauswähr] nvarchar(255)
     ,[Betrag] nvarchar(255)
     ,[Urspr.Kürzungsbetrag] nvarchar(255)
     ,[Betrag Hauptbuch] nvarchar(255)
     ,[Währung Hauptbuch] nvarchar(255)
     ,[urspr. Steuerbasisbetrag] nvarchar(255)
     ,[urspr. Steuerbasisbetrag.1] nvarchar(255)
     ,[Steuer Hauswährung] nvarchar(255)
     ,[Steuerbetrag] nvarchar(255)
     ,[HW-Steuerbasis] nvarchar(255)
     ,[Steuerbasisbetrag] nvarchar(255)
     ,[HW-Rückstellung] nvarchar(255)
     ,[Zusatzsteuer] nvarchar(255)
     ,[Vorzeichen Skonto] nvarchar(255)
     ,[Komponente der Versionsnummer] nvarchar(255)
     ,[Steuerart] nvarchar(255)
     ,[Gruppenkennzeichen] nvarchar(255)
     ,[Vorgang] nvarchar(255)
     ,[Quellsteuerbasis] nvarchar(255)
     ,[Gesicherter Kurs] nvarchar(255)
     ,[Gesicherter Betrag] nvarchar(255)
     ,[Bewertungsdiffer.] nvarchar(255)
     ,[Bewertungsdifferenz 2] nvarchar(255)
     ,[Valutadatum] nvarchar(255)
     ,[Zuordnung] nvarchar(255)
     ,[Text] nvarchar(255)
     ,[Zinssperre] nvarchar(255)
     ,[Partnergesellschaft] nvarchar(255)
     ,[Bewegungsart] nvarchar(255)
     ,[Konzernkontonummer] nvarchar(255)
     ,[Vorgangsart GL] nvarchar(255)
     ,[Dispositions-Ebene] nvarchar(255)
     ,[Dispositionsgruppe] nvarchar(255)
     ,[Disponierter Betrag] nvarchar(255)
     ,[Dispositions-Datum] nvarchar(255)
     ,[Finanzplan] nvarchar(255)
     ,[Kostenrechnungskreis] nvarchar(255)
     ,[Kostenstelle] nvarchar(255)
     ,[unbenutzt] nvarchar(255)
     ,[Auftrag] nvarchar(255)
     ,[Faktura] nvarchar(255)
     ,[Verkaufsbeleg] nvarchar(255)
     ,[Position.1] nvarchar(255)
     ,[Einteilungsnummer] nvarchar(255)
     ,[Anlage] nvarchar(255)
     ,[Unternummer] nvarchar(255)
     ,[Bewegungsart Anlagen] nvarchar(255)
     ,[Bezugsdatum] nvarchar(255)
     ,[Personalnummer] nvarchar(255)
     ,[Umsatzwirksam] nvarchar(255)
     ,[Kennzeichen: Hauptbuchkonto resident ?] nvarchar(255)
     ,[Einzelpostenanzeige möglich] nvarchar(255)
     ,[Verwaltung offener Posten] nvarchar(255)
     ,[Individ Ze] nvarchar(255)
     ,[Kstbuchung statist] nvarchar(255)
     ,[Auftr.buchung stat.] nvarchar(255)
     ,[Projkt.buch. stat.] nvarchar(255)
     ,[Erg.buchung stat.] nvarchar(255)
     ,[Kennzeichen: Faktura Update erfolgt ?] nvarchar(255)
     ,[Kennzeichen: Umbuchung aus Anzahlung ?] nvarchar(255)
     ,[Kennzeichen: Anzahlung im Nettoverfahren] nvarchar(255)
     ,[Ohne Skonto] nvarchar(255)
     ,[Investititionskennz] nvarchar(255)
     ,[Position anzeigen] nvarchar(255)
     ,[Automatisch erzeugte Position] nvarchar(255)
     ,[Kennzeichen: Posten nicht kopierbar ?] nvarchar(255)
     ,[Zahlungsvorgang] nvarchar(255)
     ,[Sachkonto] nvarchar(255)
     ,[Hauptbuchkonto] nvarchar(255)
     ,[Debitor] nvarchar(255)
     ,[Kreditor] nvarchar(255)
     ,[Filialkonto] nvarchar(255)
     ,[Bestandskonto] nvarchar(255)
     ,[Erfolgskontentyp] nvarchar(255)
     ,[Hauptbuch-Zuordnung] nvarchar(255)
     ,[Zahlungsfr.basis] nvarchar(255)
     ,[Zahlungsbedingung] nvarchar(255)
     ,[Tage 1] nvarchar(255)
     ,[Tage 2] nvarchar(255)
     ,[Tage netto] nvarchar(255)
     ,[Skontosatz 1] nvarchar(255)
     ,[Skontosatz 2] nvarchar(255)
     ,[Skontobasis] nvarchar(255)
     ,[Skontobetrag] nvarchar(255)
     ,[Skontobetrag.1] nvarchar(255)
     ,[Zahlweg] nvarchar(255)
     ,[Zahlungssperre] nvarchar(255)
     ,[Fixiert] nvarchar(255)
     ,[Hausbank] nvarchar(255)
     ,[Partnerbanktyp] nvarchar(255)
     ,[Zahlungsbetrag] nvarchar(255)
     ,[Steuerkennzeichen.1] nvarchar(255)
     ,[Betrag.1] nvarchar(255)
     ,[FW-Betrag] nvarchar(255)
     ,[Steuerkennzeichen.2] nvarchar(255)
     ,[Betrag.2] nvarchar(255)
     ,[FW-Betrag.1] nvarchar(255)
     ,[Steuerkennzeichen.3] nvarchar(255)
     ,[Betrag.3] nvarchar(255)
     ,[FW-Betrag.2] nvarchar(255)
     ,[Rechnungsbezug] nvarchar(255)
     ,[Geschäftsjahr.1] nvarchar(255)
     ,[Position.2] nvarchar(255)
     ,[Art des Folgebelegs] nvarchar(255)
     ,[Zolltarifnummer] nvarchar(255)
     ,[Zolldatum] nvarchar(255)
     ,[LZB-Kennzeichen] nvarchar(255)
     ,[Lieferland] nvarchar(255)
     ,[Dienstleistungskz.] nvarchar(255)
     ,[Sammelrechnung] nvarchar(255)
     ,[Abrechn.Per.] nvarchar(255)
     ,[Versicherungskennz] nvarchar(255)
     ,[Versicherungsdatum] nvarchar(255)
     ,[Verwendungsbeleg] nvarchar(255)
     ,[Jahr] nvarchar(255)
     ,[Diskontbelegzeile] nvarchar(255)
     ,[Wechselverwendung] nvarchar(255)
     ,[Wechselanforderung] nvarchar(255)
     ,[Gjahr] nvarchar(255)
     ,[Buchungskreis.1] nvarchar(255)
     ,[Rücksend. bis] nvarchar(255)
     ,[Präferenzbetrag] nvarchar(255)
     ,[Präferenzkennz.] nvarchar(255)
     ,[Präf.Prozentsatz] nvarchar(255)
     ,[Mahnschlüssel] nvarchar(255)
     ,[Mahnsperre] nvarchar(255)
     ,[Letzte Mahnung] nvarchar(255)
     ,[Mahnstufe] nvarchar(255)
     ,[Mahnbereich] nvarchar(255)
     ,[PBC/ESR-Nummer] nvarchar(255)
     ,[ESR-Referenznummer] nvarchar(255)
     ,[Prüfziffer] nvarchar(255)
     ,[Kreditkontr.betrag] nvarchar(255)
     ,[Befreiungsnummer] nvarchar(255)
     ,[Quellsteuerbetrag] nvarchar(255)
     ,[Qst.Freibetrag] nvarchar(255)
     ,[Nicht abzugsfähig] nvarchar(255)
     ,[Nicht abzugsfähig.1] nvarchar(255)
     ,[Material] nvarchar(255)
     ,[Werk] nvarchar(255)
     ,[Menge] nvarchar(255)
     ,[Basismengeneinheit] nvarchar(255)
     ,[Menge in ErfassME] nvarchar(255)
     ,[ErfassungsMngEinh] nvarchar(255)
     ,[Menge in BPME] nvarchar(255)
     ,[BestPreisMngEinheit] nvarchar(255)
     ,[Einkaufsbeleg] nvarchar(255)
     ,[Position.3] nvarchar(255)
     ,[Laufende Kontierung] nvarchar(255)
     ,[Endlieferung] nvarchar(255)
     ,[Preissteuerung] nvarchar(255)
     ,[Preiseinheit] nvarchar(255)
     ,[Bewertungskreis] nvarchar(255)
     ,[Bewertungsart] nvarchar(255)
     ,[Wertestring] nvarchar(255)
     ,[Rechnungswert] nvarchar(255)
     ,[Rechnungswert in FW] nvarchar(255)
     ,[Betrag.4] nvarchar(255)
     ,[Betrag.5] nvarchar(255)
     ,[Alternative Preisst.] nvarchar(255)
     ,[Neuer Preis] nvarchar(255)
     ,[Nachbelastung] nvarchar(255)
     ,[Sperrgrund Preis] nvarchar(255)
     ,[Sperrgrund Menge] nvarchar(255)
     ,[Sperrgrund Termin] nvarchar(255)
     ,[Sperrgrund BPMenge] nvarchar(255)
     ,[Sperrgrund Projekt] nvarchar(255)
     ,[Sperrgrund manuell] nvarchar(255)
     ,[Umsatzsteuer-Id.Nr] nvarchar(255)
     ,[Bestimmungsland] nvarchar(255)
     ,[Lieferland.1] nvarchar(255)
     ,[Differenzgrund] nvarchar(255)
     ,[Zugangsjahr] nvarchar(255)
     ,[Zugangsperiode] nvarchar(255)
     ,[Realisierte Differ.] nvarchar(255)
     ,[Realisierte Differenz 2] nvarchar(255)
     ,[Profitcenter] nvarchar(255)
     ,[Hauptbuch manuell] nvarchar(255)
     ,[Joint Venture] nvarchar(255)
     ,[Kostentyp] nvarchar(255)
     ,[Beteiligungsgruppe] nvarchar(255)
     ,[Partner] nvarchar(255)
     ,[Vertragsart] nvarchar(255)
     ,[Vertragsnummer] nvarchar(255)
     ,[Bewegungsart.1] nvarchar(255)
     ,[Depot] nvarchar(255)
     ,[Steuerstandort] nvarchar(255)
     ,[Immobilienschlüss.] nvarchar(255)
     ,[Bezugsdatum.1] nvarchar(255)
     ,[Optionssatz] nvarchar(255)
     ,[Finanzposition] nvarchar(255)
     ,[Kostenträger] nvarchar(255)
     ,[Netzplan] nvarchar(255)
     ,[Plannummer Vorgänge] nvarchar(255)
     ,[Zähler] nvarchar(255)
     ,[PSP-Element] nvarchar(255)
     ,[Ergebnisobjektnummer] nvarchar(255)
     ,[Subnummer] nvarchar(255)
     ,[Sperrgrund Betragshöhe] nvarchar(255)
     ,[Sperrgrund Qualität] nvarchar(255)
     ,[Abrechnungstyp] nvarchar(255)
     ,[Beteiligungsklasse] nvarchar(255)
     ,[EU-Dreiecksgeschäft] nvarchar(255)
     ,[Laufende Nummer] nvarchar(255)
     ,[Herkunftsgruppe] nvarchar(255)
     ,[HW2-Betrag] nvarchar(255)
     ,[HW3-Betrag] nvarchar(255)
     ,[Betrag.6] nvarchar(255)
     ,[Betrag.7] nvarchar(255)
     ,[Betrag.8] nvarchar(255)
     ,[Betrag.9] nvarchar(255)
     ,[Betrag.10] nvarchar(255)
     ,[Betrag.11] nvarchar(255)
     ,[HW2-Steuerbetrag] nvarchar(255)
     ,[HW3-Steuerbetrag] nvarchar(255)
     ,[Nicht abzugsf. HW2] nvarchar(255)
     ,[Nicht abzugsf. HW3] nvarchar(255)
     ,[Skontobetrag HW2] nvarchar(255)
     ,[Skontobetrag HW3] nvarchar(255)
     ,[Bewertungsdifferenz 3] nvarchar(255)
     ,[Realisierte Differenz 3] nvarchar(255)
     ,[Methode, mit der der Hauswährungsbetrag] nvarchar(255)
     ,[Fortschreibungsmethode] nvarchar(255)
     ,[Rücknahme Ausgleich] nvarchar(255)
     ,[Zahlwegzusatz] nvarchar(255)
     ,[Alternative Kontonummer] nvarchar(255)
     ,[Finanzstelle] nvarchar(255)
     ,[Fonds] nvarchar(255)
     ,[Steuer Buchungskreis] nvarchar(255)
     ,[Steuerbasisbetrag HW2] nvarchar(255)
     ,[Steuerbasisbetrag HW3] nvarchar(255)
     ,[PartnerPrctr] nvarchar(255)
     ,[Referenzschlüssel 1] nvarchar(255)
     ,[Referenzschlüssel 2] nvarchar(255)
     ,[Mittelvormerkung] nvarchar(255)
     ,[Belegposition] nvarchar(255)
     ,[Statistischer Steuerbetrag in Belegwaehr] nvarchar(255)
     ,[Funktionsbereich] nvarchar(255)
     ,[Org.Position] nvarchar(255)
     ,[Negativbuchung] nvarchar(255)
     ,[Zhlgskartenposition] nvarchar(255)
     ,[Abrechnungslauf] nvarchar(255)
     ,[Kreditkontr.Bereich] nvarchar(255)
     ,[Zahlungsempf] nvarchar(255)
     ,[Referenzschlüssel 3] nvarchar(255)
     ,[Weisung 1] nvarchar(255)
     ,[Weisung 2] nvarchar(255)
     ,[Weisung 3] nvarchar(255)
     ,[Weisung 4] nvarchar(255)
     ,[Tätigkeit BE-Steuer] nvarchar(255)
     ,[Region] nvarchar(255)
     ,[Verteilungsart] nvarchar(255)
     ,[Zahlung unterwegs] nvarchar(255)
     ,[Zahlungsreferenz] nvarchar(255)
     ,[Abgesich.Betrag] nvarchar(255)
     ,[Inflationsindex] nvarchar(255)
     ,[Letztes Anpassungsdatum] nvarchar(255)
     ,[Kontierungstyp] nvarchar(255)
     ,[Kontierung] nvarchar(255)
     ,[Datum Uebergabe an ger. Mahnverfahren] nvarchar(255)
     ,[Steuerdatum] nvarchar(255)
     ,[Ausgleichsposition] nvarchar(255)
     ,[Zahlwährung] nvarchar(255)
     ,[Betrag Zahlwähr] nvarchar(255)
     ,[Geschäftsort] nvarchar(255)
     ,[Quellensteuersektion] nvarchar(255)
     ,[Leistungsart] nvarchar(255)
     ,[Zessionskennzeichen] nvarchar(255)
     ,[Geschäftsprozeß] nvarchar(255)
     ,[Realis. Differ.] nvarchar(255)
     ,[Realis. Differ..1] nvarchar(255)
     ,[Realis. Differ..2] nvarchar(255)
     ,[Strafzins HW] nvarchar(255)
     ,[Strafzins 2.HW] nvarchar(255)
     ,[Strafzins 3.HW.] nvarchar(255)
     ,[Strafzins] nvarchar(255)
     ,[Verzugstage] nvarchar(255)
     ,[Grund für Verzug] nvarchar(255)
     ,[Förderung] nvarchar(255)
     ,[Steueranteil FI-CA Hauswährung] nvarchar(255)
     ,[Funktionsbereich.1] nvarchar(255)
     ,[Übergabe an Vollstreckung] nvarchar(255)
     ,[Art der Nebenforderung] nvarchar(255)
     ,[RE-Immo-Schlüssel] nvarchar(255)
     ,[Haushaltsprogramm] nvarchar(255)
     ,[AusglGeschäftsjahr] nvarchar(255)
     ,[PPA Exclude Ind.] nvarchar(255)
     ,[Buchungszeile] nvarchar(255)
     ,[Segment] nvarchar(255)
     ,[Partnersegment] nvarchar(255)
     ,[Partnerfunktionsber] nvarchar(255)
     ,[Konto-Id] nvarchar(255)
     ,[Kostenart] nvarchar(255)
     ,[Ledgergruppenspezifisches Ausgleichen] nvarchar(255)
     ,[Belegpositionsnummer für Steuerbeleg] nvarchar(255)
     ,[Zahlungsdienstleister] nvarchar(255)
     ,[Zahlungsref. des Zahlungsdienstleisters] nvarchar(255)
     ,[Mandatsreferenz] nvarchar(255)
     ,[Zahlfreigabe erfolgt] nvarchar(255)
     ,[Referenzvorgang] nvarchar(255)
     ,[Referenzschlüssel] nvarchar(255)
     ,[LogSystem Ursprung] nvarchar(255)
     ,[Position.4] nvarchar(255)
     ,[Position im Sender System] nvarchar(255)
     ,[Buchungsperiode] nvarchar(255)
     ,[Belegstatus] nvarchar(255)
     ,[Buchungsdatum] nvarchar(255)
     ,[Belegdatum] nvarchar(255)
     ,[Währung] nvarchar(255)
     ,[Belegart] nvarchar(255)
     ,[Hauswährung] nvarchar(255)
     ,[Hauswährung 2] nvarchar(255)
     ,[Hauswährung 3] nvarchar(255)
     ,[Nettofälligkeit] nvarchar(255)
     ,[Skonto 1 Fälligkeit] nvarchar(255)
     ,[Skonto 2 Fälligkeit] nvarchar(255)
     ,[Datenfilterwert für Data Aging] nvarchar(255)
     ,[Bewegungsart.2] nvarchar(255)
     ,[Liquiditätsposition] nvarchar(255)
     ,[Konto Gegenbuchung] nvarchar(255)
     ,[Gegenkontoart] nvarchar(255)
     ,[Gegenkonto im Hauptbuch] nvarchar(255)
     ,[Vorzeichen der Menge] nvarchar(255)
     ,[Unternummer.1] nvarchar(255)
     ,[Bewegungsart.3] nvarchar(255)
     ,[Bezugsdatum.2] nvarchar(255)
     ,[Vollabgang] nvarchar(255)
     ,[Buchungsbetrag] nvarchar(255)
     ,[Prozentsatz] nvarchar(255)
     ,[ZZGEO_LOCATION] nvarchar(255)
     ,[ZZ_LOCATION] nvarchar(255)
     ,[Dummyfunktion in der Laenge 1] nvarchar(255)
     ,[Buchungskreis.2] nvarchar(255)
     ,[Aufwands- bzw. Ertragskto im ZBHB] nvarchar(255)
     ,[Partnerfonds] nvarchar(255)
     ,[Partnerförderung] nvarchar(255)
     ,[Budgetperiode] nvarchar(255)
     ,[Partner Budgtperiode] nvarchar(255)
     ,[J_1TPBUPL] nvarchar(255)
     ,[Anfang des Leistungserbringungszeitraums] nvarchar(255)
     ,[Ende des Leistungserbringungszeitraums] nvarchar(255)
     ,[Knz. für Fast Pay] nvarchar(255)
     ,[IGNR_IVREF] nvarchar(255)
     ,[Felder US-Regierung] nvarchar(255)
     ,[HHM-Referenzbelegnummer] nvarchar(255)
     ,[HHM-Referenzjahr] nvarchar(255)
     ,[HHM-Referenzeinzelposten] nvarchar(255)
     ,[HHM-Referenzabfolge der Kontierungen] nvarchar(255)
     ,[Produktionsmonat] nvarchar(255)
     ,[RECRF] nvarchar(255)
)
go

--insert the data
BULK INSERT import.SAP_Test_Data_BSEG Table
    FROM 'C:\Users\Niclas\Development\PA2\Tool_Niclas_23.06.2022 (1)\processed\SAP_Test_Data_BSEG Table.txt_processed'
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

select COUNT(1) from import.SAP_Test_Data_BSEG Table
--
--expected: "5000"

select top 10 * from import.SAP_Test_Data_BSEG Table
--

--The next line checks for exact duplicates, can take a long time!
select count(1) from (select distinct * from import.SAP_Test_Data_BSEG Table) temp
--

--Remember to check the primary key! Sorry, the script didn't know the primary key
select distinct [KEY_COLUMNS] from import.SAP_Test_Data_BSEG Table
--

select distinct top 20 ltrim(rtrim([Buchungskreis])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Belegnummer])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Geschäftsjahr])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Position])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Buchungszeilen-Id])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Ausgleichsdatum])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Erf.Dat.  Ausgleich])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Ausgleichsbeleg])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Buchungsschlüssel])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Kontoart])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Sonderhauptb.Kennz.])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Vorgangsklasse SHB])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Ziel-Sonderhb.Kz.])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Soll/Haben-Kennz.])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Geschäftsbereich])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([PartnerGsber])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Steuerkennzeichen])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Quellsteuerkennz.])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Betrag Hauswähr])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Betrag])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Urspr.Kürzungsbetrag])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Betrag Hauptbuch])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Währung Hauptbuch])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([urspr. Steuerbasisbetrag])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([urspr. Steuerbasisbetrag.1])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Steuer Hauswährung])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Steuerbetrag])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([HW-Steuerbasis])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Steuerbasisbetrag])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([HW-Rückstellung])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Zusatzsteuer])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Vorzeichen Skonto])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Komponente der Versionsnummer])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Steuerart])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Gruppenkennzeichen])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Vorgang])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Quellsteuerbasis])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Gesicherter Kurs])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Gesicherter Betrag])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Bewertungsdiffer.])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Bewertungsdifferenz 2])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Valutadatum])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Zuordnung])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Text])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Zinssperre])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Partnergesellschaft])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Bewegungsart])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Konzernkontonummer])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Vorgangsart GL])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Dispositions-Ebene])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Dispositionsgruppe])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Disponierter Betrag])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Dispositions-Datum])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Finanzplan])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Kostenrechnungskreis])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Kostenstelle])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([unbenutzt])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Auftrag])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Faktura])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Verkaufsbeleg])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Position.1])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Einteilungsnummer])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Anlage])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Unternummer])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Bewegungsart Anlagen])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Bezugsdatum])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Personalnummer])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Umsatzwirksam])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Kennzeichen: Hauptbuchkonto resident ?])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Einzelpostenanzeige möglich])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Verwaltung offener Posten])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Individ Ze])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Kstbuchung statist])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Auftr.buchung stat.])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Projkt.buch. stat.])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Erg.buchung stat.])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Kennzeichen: Faktura Update erfolgt ?])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Kennzeichen: Umbuchung aus Anzahlung ?])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Kennzeichen: Anzahlung im Nettoverfahren])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Ohne Skonto])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Investititionskennz])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Position anzeigen])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Automatisch erzeugte Position])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Kennzeichen: Posten nicht kopierbar ?])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Zahlungsvorgang])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Sachkonto])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Hauptbuchkonto])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Debitor])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Kreditor])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Filialkonto])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Bestandskonto])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Erfolgskontentyp])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Hauptbuch-Zuordnung])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Zahlungsfr.basis])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Zahlungsbedingung])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Tage 1])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Tage 2])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Tage netto])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Skontosatz 1])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Skontosatz 2])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Skontobasis])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Skontobetrag])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Skontobetrag.1])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Zahlweg])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Zahlungssperre])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Fixiert])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Hausbank])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Partnerbanktyp])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Zahlungsbetrag])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Steuerkennzeichen.1])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Betrag.1])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([FW-Betrag])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Steuerkennzeichen.2])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Betrag.2])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([FW-Betrag.1])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Steuerkennzeichen.3])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Betrag.3])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([FW-Betrag.2])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Rechnungsbezug])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Geschäftsjahr.1])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Position.2])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Art des Folgebelegs])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Zolltarifnummer])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Zolldatum])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([LZB-Kennzeichen])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Lieferland])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Dienstleistungskz.])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Sammelrechnung])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Abrechn.Per.])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Versicherungskennz])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Versicherungsdatum])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Verwendungsbeleg])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Jahr])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Diskontbelegzeile])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Wechselverwendung])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Wechselanforderung])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Gjahr])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Buchungskreis.1])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Rücksend. bis])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Präferenzbetrag])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Präferenzkennz.])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Präf.Prozentsatz])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Mahnschlüssel])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Mahnsperre])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Letzte Mahnung])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Mahnstufe])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Mahnbereich])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([PBC/ESR-Nummer])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([ESR-Referenznummer])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Prüfziffer])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Kreditkontr.betrag])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Befreiungsnummer])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Quellsteuerbetrag])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Qst.Freibetrag])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Nicht abzugsfähig])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Nicht abzugsfähig.1])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Material])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Werk])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Menge])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Basismengeneinheit])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Menge in ErfassME])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([ErfassungsMngEinh])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Menge in BPME])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([BestPreisMngEinheit])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Einkaufsbeleg])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Position.3])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Laufende Kontierung])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Endlieferung])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Preissteuerung])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Preiseinheit])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Bewertungskreis])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Bewertungsart])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Wertestring])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Rechnungswert])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Rechnungswert in FW])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Betrag.4])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Betrag.5])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Alternative Preisst.])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Neuer Preis])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Nachbelastung])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Sperrgrund Preis])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Sperrgrund Menge])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Sperrgrund Termin])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Sperrgrund BPMenge])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Sperrgrund Projekt])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Sperrgrund manuell])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Umsatzsteuer-Id.Nr])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Bestimmungsland])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Lieferland.1])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Differenzgrund])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Zugangsjahr])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Zugangsperiode])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Realisierte Differ.])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Realisierte Differenz 2])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Profitcenter])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Hauptbuch manuell])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Joint Venture])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Kostentyp])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Beteiligungsgruppe])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Partner])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Vertragsart])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Vertragsnummer])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Bewegungsart.1])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Depot])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Steuerstandort])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Immobilienschlüss.])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Bezugsdatum.1])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Optionssatz])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Finanzposition])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Kostenträger])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Netzplan])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Plannummer Vorgänge])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Zähler])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([PSP-Element])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Ergebnisobjektnummer])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Subnummer])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Sperrgrund Betragshöhe])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Sperrgrund Qualität])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Abrechnungstyp])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Beteiligungsklasse])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([EU-Dreiecksgeschäft])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Laufende Nummer])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Herkunftsgruppe])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([HW2-Betrag])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([HW3-Betrag])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Betrag.6])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Betrag.7])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Betrag.8])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Betrag.9])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Betrag.10])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Betrag.11])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([HW2-Steuerbetrag])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([HW3-Steuerbetrag])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Nicht abzugsf. HW2])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Nicht abzugsf. HW3])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Skontobetrag HW2])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Skontobetrag HW3])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Bewertungsdifferenz 3])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Realisierte Differenz 3])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Methode, mit der der Hauswährungsbetrag])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Fortschreibungsmethode])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Rücknahme Ausgleich])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Zahlwegzusatz])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Alternative Kontonummer])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Finanzstelle])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Fonds])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Steuer Buchungskreis])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Steuerbasisbetrag HW2])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Steuerbasisbetrag HW3])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([PartnerPrctr])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Referenzschlüssel 1])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Referenzschlüssel 2])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Mittelvormerkung])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Belegposition])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Statistischer Steuerbetrag in Belegwaehr])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Funktionsbereich])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Org.Position])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Negativbuchung])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Zhlgskartenposition])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Abrechnungslauf])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Kreditkontr.Bereich])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Zahlungsempf])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Referenzschlüssel 3])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Weisung 1])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Weisung 2])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Weisung 3])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Weisung 4])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Tätigkeit BE-Steuer])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Region])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Verteilungsart])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Zahlung unterwegs])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Zahlungsreferenz])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Abgesich.Betrag])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Inflationsindex])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Letztes Anpassungsdatum])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Kontierungstyp])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Kontierung])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Datum Uebergabe an ger. Mahnverfahren])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Steuerdatum])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Ausgleichsposition])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Zahlwährung])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Betrag Zahlwähr])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Geschäftsort])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Quellensteuersektion])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Leistungsart])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Zessionskennzeichen])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Geschäftsprozeß])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Realis. Differ.])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Realis. Differ..1])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Realis. Differ..2])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Strafzins HW])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Strafzins 2.HW])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Strafzins 3.HW.])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Strafzins])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Verzugstage])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Grund für Verzug])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Förderung])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Steueranteil FI-CA Hauswährung])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Funktionsbereich.1])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Übergabe an Vollstreckung])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Art der Nebenforderung])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([RE-Immo-Schlüssel])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Haushaltsprogramm])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([AusglGeschäftsjahr])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([PPA Exclude Ind.])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Buchungszeile])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Segment])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Partnersegment])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Partnerfunktionsber])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Konto-Id])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Kostenart])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Ledgergruppenspezifisches Ausgleichen])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Belegpositionsnummer für Steuerbeleg])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Zahlungsdienstleister])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Zahlungsref. des Zahlungsdienstleisters])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Mandatsreferenz])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Zahlfreigabe erfolgt])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Referenzvorgang])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Referenzschlüssel])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([LogSystem Ursprung])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Position.4])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Position im Sender System])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Buchungsperiode])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Belegstatus])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Buchungsdatum])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Belegdatum])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Währung])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Belegart])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Hauswährung])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Hauswährung 2])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Hauswährung 3])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Nettofälligkeit])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Skonto 1 Fälligkeit])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Skonto 2 Fälligkeit])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Datenfilterwert für Data Aging])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Bewegungsart.2])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Liquiditätsposition])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Konto Gegenbuchung])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Gegenkontoart])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Gegenkonto im Hauptbuch])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Vorzeichen der Menge])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Unternummer.1])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Bewegungsart.3])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Bezugsdatum.2])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Vollabgang])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Buchungsbetrag])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Prozentsatz])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([ZZGEO_LOCATION])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([ZZ_LOCATION])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Dummyfunktion in der Laenge 1])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Buchungskreis.2])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Aufwands- bzw. Ertragskto im ZBHB])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Partnerfonds])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Partnerförderung])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Budgetperiode])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Partner Budgtperiode])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([J_1TPBUPL])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Anfang des Leistungserbringungszeitraums])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Ende des Leistungserbringungszeitraums])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Knz. für Fast Pay])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([IGNR_IVREF])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Felder US-Regierung])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([HHM-Referenzbelegnummer])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([HHM-Referenzjahr])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([HHM-Referenzeinzelposten])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([HHM-Referenzabfolge der Kontierungen])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([Produktionsmonat])) from import.SAP_Test_Data_BSEG Table         --
select distinct top 20 ltrim(rtrim([RECRF])) from import.SAP_Test_Data_BSEG Table         --



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

IF OBJECT_ID('transform.SAP_Test_Data_BSEG Table','U') IS NOT NULL
drop table transform.SAP_Test_Data_BSEG Table
go

select
	   ltrim(rtrim([Buchungskreis])) as [Buchungskreis]
	  ,ltrim(rtrim([Belegnummer])) as [Belegnummer]
	  ,ltrim(rtrim([Geschäftsjahr])) as [Geschäftsjahr]
	  ,ltrim(rtrim([Position])) as [Position]
	  ,ltrim(rtrim([Buchungszeilen-Id])) as [Buchungszeilen-Id]
	  ,ltrim(rtrim([Ausgleichsdatum])) as [Ausgleichsdatum]
	  ,ltrim(rtrim([Erf.Dat.  Ausgleich])) as [Erf.Dat.  Ausgleich]
	  ,ltrim(rtrim([Ausgleichsbeleg])) as [Ausgleichsbeleg]
	  ,ltrim(rtrim([Buchungsschlüssel])) as [Buchungsschlüssel]
	  ,ltrim(rtrim([Kontoart])) as [Kontoart]
	  ,ltrim(rtrim([Sonderhauptb.Kennz.])) as [Sonderhauptb.Kennz.]
	  ,ltrim(rtrim([Vorgangsklasse SHB])) as [Vorgangsklasse SHB]
	  ,ltrim(rtrim([Ziel-Sonderhb.Kz.])) as [Ziel-Sonderhb.Kz.]
	  ,ltrim(rtrim([Soll/Haben-Kennz.])) as [Soll/Haben-Kennz.]
	  ,ltrim(rtrim([Geschäftsbereich])) as [Geschäftsbereich]
	  ,ltrim(rtrim([PartnerGsber])) as [PartnerGsber]
	  ,ltrim(rtrim([Steuerkennzeichen])) as [Steuerkennzeichen]
	  ,ltrim(rtrim([Quellsteuerkennz.])) as [Quellsteuerkennz.]
	  ,ltrim(rtrim([Betrag Hauswähr])) as [Betrag Hauswähr]
	  ,ltrim(rtrim([Betrag])) as [Betrag]
	  ,ltrim(rtrim([Urspr.Kürzungsbetrag])) as [Urspr.Kürzungsbetrag]
	  ,ltrim(rtrim([Betrag Hauptbuch])) as [Betrag Hauptbuch]
	  ,ltrim(rtrim([Währung Hauptbuch])) as [Währung Hauptbuch]
	  ,ltrim(rtrim([urspr. Steuerbasisbetrag])) as [urspr. Steuerbasisbetrag]
	  ,ltrim(rtrim([urspr. Steuerbasisbetrag.1])) as [urspr. Steuerbasisbetrag.1]
	  ,ltrim(rtrim([Steuer Hauswährung])) as [Steuer Hauswährung]
	  ,ltrim(rtrim([Steuerbetrag])) as [Steuerbetrag]
	  ,ltrim(rtrim([HW-Steuerbasis])) as [HW-Steuerbasis]
	  ,ltrim(rtrim([Steuerbasisbetrag])) as [Steuerbasisbetrag]
	  ,ltrim(rtrim([HW-Rückstellung])) as [HW-Rückstellung]
	  ,ltrim(rtrim([Zusatzsteuer])) as [Zusatzsteuer]
	  ,ltrim(rtrim([Vorzeichen Skonto])) as [Vorzeichen Skonto]
	  ,ltrim(rtrim([Komponente der Versionsnummer])) as [Komponente der Versionsnummer]
	  ,ltrim(rtrim([Steuerart])) as [Steuerart]
	  ,ltrim(rtrim([Gruppenkennzeichen])) as [Gruppenkennzeichen]
	  ,ltrim(rtrim([Vorgang])) as [Vorgang]
	  ,ltrim(rtrim([Quellsteuerbasis])) as [Quellsteuerbasis]
	  ,ltrim(rtrim([Gesicherter Kurs])) as [Gesicherter Kurs]
	  ,ltrim(rtrim([Gesicherter Betrag])) as [Gesicherter Betrag]
	  ,ltrim(rtrim([Bewertungsdiffer.])) as [Bewertungsdiffer.]
	  ,ltrim(rtrim([Bewertungsdifferenz 2])) as [Bewertungsdifferenz 2]
	  ,ltrim(rtrim([Valutadatum])) as [Valutadatum]
	  ,ltrim(rtrim([Zuordnung])) as [Zuordnung]
	  ,ltrim(rtrim([Text])) as [Text]
	  ,ltrim(rtrim([Zinssperre])) as [Zinssperre]
	  ,ltrim(rtrim([Partnergesellschaft])) as [Partnergesellschaft]
	  ,ltrim(rtrim([Bewegungsart])) as [Bewegungsart]
	  ,ltrim(rtrim([Konzernkontonummer])) as [Konzernkontonummer]
	  ,ltrim(rtrim([Vorgangsart GL])) as [Vorgangsart GL]
	  ,ltrim(rtrim([Dispositions-Ebene])) as [Dispositions-Ebene]
	  ,ltrim(rtrim([Dispositionsgruppe])) as [Dispositionsgruppe]
	  ,ltrim(rtrim([Disponierter Betrag])) as [Disponierter Betrag]
	  ,ltrim(rtrim([Dispositions-Datum])) as [Dispositions-Datum]
	  ,ltrim(rtrim([Finanzplan])) as [Finanzplan]
	  ,ltrim(rtrim([Kostenrechnungskreis])) as [Kostenrechnungskreis]
	  ,ltrim(rtrim([Kostenstelle])) as [Kostenstelle]
	  ,ltrim(rtrim([unbenutzt])) as [unbenutzt]
	  ,ltrim(rtrim([Auftrag])) as [Auftrag]
	  ,ltrim(rtrim([Faktura])) as [Faktura]
	  ,ltrim(rtrim([Verkaufsbeleg])) as [Verkaufsbeleg]
	  ,ltrim(rtrim([Position.1])) as [Position.1]
	  ,ltrim(rtrim([Einteilungsnummer])) as [Einteilungsnummer]
	  ,ltrim(rtrim([Anlage])) as [Anlage]
	  ,ltrim(rtrim([Unternummer])) as [Unternummer]
	  ,ltrim(rtrim([Bewegungsart Anlagen])) as [Bewegungsart Anlagen]
	  ,ltrim(rtrim([Bezugsdatum])) as [Bezugsdatum]
	  ,ltrim(rtrim([Personalnummer])) as [Personalnummer]
	  ,ltrim(rtrim([Umsatzwirksam])) as [Umsatzwirksam]
	  ,ltrim(rtrim([Kennzeichen: Hauptbuchkonto resident ?])) as [Kennzeichen: Hauptbuchkonto resident ?]
	  ,ltrim(rtrim([Einzelpostenanzeige möglich])) as [Einzelpostenanzeige möglich]
	  ,ltrim(rtrim([Verwaltung offener Posten])) as [Verwaltung offener Posten]
	  ,ltrim(rtrim([Individ Ze])) as [Individ Ze]
	  ,ltrim(rtrim([Kstbuchung statist])) as [Kstbuchung statist]
	  ,ltrim(rtrim([Auftr.buchung stat.])) as [Auftr.buchung stat.]
	  ,ltrim(rtrim([Projkt.buch. stat.])) as [Projkt.buch. stat.]
	  ,ltrim(rtrim([Erg.buchung stat.])) as [Erg.buchung stat.]
	  ,ltrim(rtrim([Kennzeichen: Faktura Update erfolgt ?])) as [Kennzeichen: Faktura Update erfolgt ?]
	  ,ltrim(rtrim([Kennzeichen: Umbuchung aus Anzahlung ?])) as [Kennzeichen: Umbuchung aus Anzahlung ?]
	  ,ltrim(rtrim([Kennzeichen: Anzahlung im Nettoverfahren])) as [Kennzeichen: Anzahlung im Nettoverfahren]
	  ,ltrim(rtrim([Ohne Skonto])) as [Ohne Skonto]
	  ,ltrim(rtrim([Investititionskennz])) as [Investititionskennz]
	  ,ltrim(rtrim([Position anzeigen])) as [Position anzeigen]
	  ,ltrim(rtrim([Automatisch erzeugte Position])) as [Automatisch erzeugte Position]
	  ,ltrim(rtrim([Kennzeichen: Posten nicht kopierbar ?])) as [Kennzeichen: Posten nicht kopierbar ?]
	  ,ltrim(rtrim([Zahlungsvorgang])) as [Zahlungsvorgang]
	  ,ltrim(rtrim([Sachkonto])) as [Sachkonto]
	  ,ltrim(rtrim([Hauptbuchkonto])) as [Hauptbuchkonto]
	  ,ltrim(rtrim([Debitor])) as [Debitor]
	  ,ltrim(rtrim([Kreditor])) as [Kreditor]
	  ,ltrim(rtrim([Filialkonto])) as [Filialkonto]
	  ,ltrim(rtrim([Bestandskonto])) as [Bestandskonto]
	  ,ltrim(rtrim([Erfolgskontentyp])) as [Erfolgskontentyp]
	  ,ltrim(rtrim([Hauptbuch-Zuordnung])) as [Hauptbuch-Zuordnung]
	  ,ltrim(rtrim([Zahlungsfr.basis])) as [Zahlungsfr.basis]
	  ,ltrim(rtrim([Zahlungsbedingung])) as [Zahlungsbedingung]
	  ,ltrim(rtrim([Tage 1])) as [Tage 1]
	  ,ltrim(rtrim([Tage 2])) as [Tage 2]
	  ,ltrim(rtrim([Tage netto])) as [Tage netto]
	  ,ltrim(rtrim([Skontosatz 1])) as [Skontosatz 1]
	  ,ltrim(rtrim([Skontosatz 2])) as [Skontosatz 2]
	  ,ltrim(rtrim([Skontobasis])) as [Skontobasis]
	  ,ltrim(rtrim([Skontobetrag])) as [Skontobetrag]
	  ,ltrim(rtrim([Skontobetrag.1])) as [Skontobetrag.1]
	  ,ltrim(rtrim([Zahlweg])) as [Zahlweg]
	  ,ltrim(rtrim([Zahlungssperre])) as [Zahlungssperre]
	  ,ltrim(rtrim([Fixiert])) as [Fixiert]
	  ,ltrim(rtrim([Hausbank])) as [Hausbank]
	  ,ltrim(rtrim([Partnerbanktyp])) as [Partnerbanktyp]
	  ,ltrim(rtrim([Zahlungsbetrag])) as [Zahlungsbetrag]
	  ,ltrim(rtrim([Steuerkennzeichen.1])) as [Steuerkennzeichen.1]
	  ,ltrim(rtrim([Betrag.1])) as [Betrag.1]
	  ,ltrim(rtrim([FW-Betrag])) as [FW-Betrag]
	  ,ltrim(rtrim([Steuerkennzeichen.2])) as [Steuerkennzeichen.2]
	  ,ltrim(rtrim([Betrag.2])) as [Betrag.2]
	  ,ltrim(rtrim([FW-Betrag.1])) as [FW-Betrag.1]
	  ,ltrim(rtrim([Steuerkennzeichen.3])) as [Steuerkennzeichen.3]
	  ,ltrim(rtrim([Betrag.3])) as [Betrag.3]
	  ,ltrim(rtrim([FW-Betrag.2])) as [FW-Betrag.2]
	  ,ltrim(rtrim([Rechnungsbezug])) as [Rechnungsbezug]
	  ,ltrim(rtrim([Geschäftsjahr.1])) as [Geschäftsjahr.1]
	  ,ltrim(rtrim([Position.2])) as [Position.2]
	  ,ltrim(rtrim([Art des Folgebelegs])) as [Art des Folgebelegs]
	  ,ltrim(rtrim([Zolltarifnummer])) as [Zolltarifnummer]
	  ,ltrim(rtrim([Zolldatum])) as [Zolldatum]
	  ,ltrim(rtrim([LZB-Kennzeichen])) as [LZB-Kennzeichen]
	  ,ltrim(rtrim([Lieferland])) as [Lieferland]
	  ,ltrim(rtrim([Dienstleistungskz.])) as [Dienstleistungskz.]
	  ,ltrim(rtrim([Sammelrechnung])) as [Sammelrechnung]
	  ,ltrim(rtrim([Abrechn.Per.])) as [Abrechn.Per.]
	  ,ltrim(rtrim([Versicherungskennz])) as [Versicherungskennz]
	  ,ltrim(rtrim([Versicherungsdatum])) as [Versicherungsdatum]
	  ,ltrim(rtrim([Verwendungsbeleg])) as [Verwendungsbeleg]
	  ,ltrim(rtrim([Jahr])) as [Jahr]
	  ,ltrim(rtrim([Diskontbelegzeile])) as [Diskontbelegzeile]
	  ,ltrim(rtrim([Wechselverwendung])) as [Wechselverwendung]
	  ,ltrim(rtrim([Wechselanforderung])) as [Wechselanforderung]
	  ,ltrim(rtrim([Gjahr])) as [Gjahr]
	  ,ltrim(rtrim([Buchungskreis.1])) as [Buchungskreis.1]
	  ,ltrim(rtrim([Rücksend. bis])) as [Rücksend. bis]
	  ,ltrim(rtrim([Präferenzbetrag])) as [Präferenzbetrag]
	  ,ltrim(rtrim([Präferenzkennz.])) as [Präferenzkennz.]
	  ,ltrim(rtrim([Präf.Prozentsatz])) as [Präf.Prozentsatz]
	  ,ltrim(rtrim([Mahnschlüssel])) as [Mahnschlüssel]
	  ,ltrim(rtrim([Mahnsperre])) as [Mahnsperre]
	  ,ltrim(rtrim([Letzte Mahnung])) as [Letzte Mahnung]
	  ,ltrim(rtrim([Mahnstufe])) as [Mahnstufe]
	  ,ltrim(rtrim([Mahnbereich])) as [Mahnbereich]
	  ,ltrim(rtrim([PBC/ESR-Nummer])) as [PBC/ESR-Nummer]
	  ,ltrim(rtrim([ESR-Referenznummer])) as [ESR-Referenznummer]
	  ,ltrim(rtrim([Prüfziffer])) as [Prüfziffer]
	  ,ltrim(rtrim([Kreditkontr.betrag])) as [Kreditkontr.betrag]
	  ,ltrim(rtrim([Befreiungsnummer])) as [Befreiungsnummer]
	  ,ltrim(rtrim([Quellsteuerbetrag])) as [Quellsteuerbetrag]
	  ,ltrim(rtrim([Qst.Freibetrag])) as [Qst.Freibetrag]
	  ,ltrim(rtrim([Nicht abzugsfähig])) as [Nicht abzugsfähig]
	  ,ltrim(rtrim([Nicht abzugsfähig.1])) as [Nicht abzugsfähig.1]
	  ,ltrim(rtrim([Material])) as [Material]
	  ,ltrim(rtrim([Werk])) as [Werk]
	  ,ltrim(rtrim([Menge])) as [Menge]
	  ,ltrim(rtrim([Basismengeneinheit])) as [Basismengeneinheit]
	  ,ltrim(rtrim([Menge in ErfassME])) as [Menge in ErfassME]
	  ,ltrim(rtrim([ErfassungsMngEinh])) as [ErfassungsMngEinh]
	  ,ltrim(rtrim([Menge in BPME])) as [Menge in BPME]
	  ,ltrim(rtrim([BestPreisMngEinheit])) as [BestPreisMngEinheit]
	  ,ltrim(rtrim([Einkaufsbeleg])) as [Einkaufsbeleg]
	  ,ltrim(rtrim([Position.3])) as [Position.3]
	  ,ltrim(rtrim([Laufende Kontierung])) as [Laufende Kontierung]
	  ,ltrim(rtrim([Endlieferung])) as [Endlieferung]
	  ,ltrim(rtrim([Preissteuerung])) as [Preissteuerung]
	  ,ltrim(rtrim([Preiseinheit])) as [Preiseinheit]
	  ,ltrim(rtrim([Bewertungskreis])) as [Bewertungskreis]
	  ,ltrim(rtrim([Bewertungsart])) as [Bewertungsart]
	  ,ltrim(rtrim([Wertestring])) as [Wertestring]
	  ,ltrim(rtrim([Rechnungswert])) as [Rechnungswert]
	  ,ltrim(rtrim([Rechnungswert in FW])) as [Rechnungswert in FW]
	  ,ltrim(rtrim([Betrag.4])) as [Betrag.4]
	  ,ltrim(rtrim([Betrag.5])) as [Betrag.5]
	  ,ltrim(rtrim([Alternative Preisst.])) as [Alternative Preisst.]
	  ,ltrim(rtrim([Neuer Preis])) as [Neuer Preis]
	  ,ltrim(rtrim([Nachbelastung])) as [Nachbelastung]
	  ,ltrim(rtrim([Sperrgrund Preis])) as [Sperrgrund Preis]
	  ,ltrim(rtrim([Sperrgrund Menge])) as [Sperrgrund Menge]
	  ,ltrim(rtrim([Sperrgrund Termin])) as [Sperrgrund Termin]
	  ,ltrim(rtrim([Sperrgrund BPMenge])) as [Sperrgrund BPMenge]
	  ,ltrim(rtrim([Sperrgrund Projekt])) as [Sperrgrund Projekt]
	  ,ltrim(rtrim([Sperrgrund manuell])) as [Sperrgrund manuell]
	  ,ltrim(rtrim([Umsatzsteuer-Id.Nr])) as [Umsatzsteuer-Id.Nr]
	  ,ltrim(rtrim([Bestimmungsland])) as [Bestimmungsland]
	  ,ltrim(rtrim([Lieferland.1])) as [Lieferland.1]
	  ,ltrim(rtrim([Differenzgrund])) as [Differenzgrund]
	  ,ltrim(rtrim([Zugangsjahr])) as [Zugangsjahr]
	  ,ltrim(rtrim([Zugangsperiode])) as [Zugangsperiode]
	  ,ltrim(rtrim([Realisierte Differ.])) as [Realisierte Differ.]
	  ,ltrim(rtrim([Realisierte Differenz 2])) as [Realisierte Differenz 2]
	  ,ltrim(rtrim([Profitcenter])) as [Profitcenter]
	  ,ltrim(rtrim([Hauptbuch manuell])) as [Hauptbuch manuell]
	  ,ltrim(rtrim([Joint Venture])) as [Joint Venture]
	  ,ltrim(rtrim([Kostentyp])) as [Kostentyp]
	  ,ltrim(rtrim([Beteiligungsgruppe])) as [Beteiligungsgruppe]
	  ,ltrim(rtrim([Partner])) as [Partner]
	  ,ltrim(rtrim([Vertragsart])) as [Vertragsart]
	  ,ltrim(rtrim([Vertragsnummer])) as [Vertragsnummer]
	  ,ltrim(rtrim([Bewegungsart.1])) as [Bewegungsart.1]
	  ,ltrim(rtrim([Depot])) as [Depot]
	  ,ltrim(rtrim([Steuerstandort])) as [Steuerstandort]
	  ,ltrim(rtrim([Immobilienschlüss.])) as [Immobilienschlüss.]
	  ,ltrim(rtrim([Bezugsdatum.1])) as [Bezugsdatum.1]
	  ,ltrim(rtrim([Optionssatz])) as [Optionssatz]
	  ,ltrim(rtrim([Finanzposition])) as [Finanzposition]
	  ,ltrim(rtrim([Kostenträger])) as [Kostenträger]
	  ,ltrim(rtrim([Netzplan])) as [Netzplan]
	  ,ltrim(rtrim([Plannummer Vorgänge])) as [Plannummer Vorgänge]
	  ,ltrim(rtrim([Zähler])) as [Zähler]
	  ,ltrim(rtrim([PSP-Element])) as [PSP-Element]
	  ,ltrim(rtrim([Ergebnisobjektnummer])) as [Ergebnisobjektnummer]
	  ,ltrim(rtrim([Subnummer])) as [Subnummer]
	  ,ltrim(rtrim([Sperrgrund Betragshöhe])) as [Sperrgrund Betragshöhe]
	  ,ltrim(rtrim([Sperrgrund Qualität])) as [Sperrgrund Qualität]
	  ,ltrim(rtrim([Abrechnungstyp])) as [Abrechnungstyp]
	  ,ltrim(rtrim([Beteiligungsklasse])) as [Beteiligungsklasse]
	  ,ltrim(rtrim([EU-Dreiecksgeschäft])) as [EU-Dreiecksgeschäft]
	  ,ltrim(rtrim([Laufende Nummer])) as [Laufende Nummer]
	  ,ltrim(rtrim([Herkunftsgruppe])) as [Herkunftsgruppe]
	  ,ltrim(rtrim([HW2-Betrag])) as [HW2-Betrag]
	  ,ltrim(rtrim([HW3-Betrag])) as [HW3-Betrag]
	  ,ltrim(rtrim([Betrag.6])) as [Betrag.6]
	  ,ltrim(rtrim([Betrag.7])) as [Betrag.7]
	  ,ltrim(rtrim([Betrag.8])) as [Betrag.8]
	  ,ltrim(rtrim([Betrag.9])) as [Betrag.9]
	  ,ltrim(rtrim([Betrag.10])) as [Betrag.10]
	  ,ltrim(rtrim([Betrag.11])) as [Betrag.11]
	  ,ltrim(rtrim([HW2-Steuerbetrag])) as [HW2-Steuerbetrag]
	  ,ltrim(rtrim([HW3-Steuerbetrag])) as [HW3-Steuerbetrag]
	  ,ltrim(rtrim([Nicht abzugsf. HW2])) as [Nicht abzugsf. HW2]
	  ,ltrim(rtrim([Nicht abzugsf. HW3])) as [Nicht abzugsf. HW3]
	  ,ltrim(rtrim([Skontobetrag HW2])) as [Skontobetrag HW2]
	  ,ltrim(rtrim([Skontobetrag HW3])) as [Skontobetrag HW3]
	  ,ltrim(rtrim([Bewertungsdifferenz 3])) as [Bewertungsdifferenz 3]
	  ,ltrim(rtrim([Realisierte Differenz 3])) as [Realisierte Differenz 3]
	  ,ltrim(rtrim([Methode, mit der der Hauswährungsbetrag])) as [Methode, mit der der Hauswährungsbetrag]
	  ,ltrim(rtrim([Fortschreibungsmethode])) as [Fortschreibungsmethode]
	  ,ltrim(rtrim([Rücknahme Ausgleich])) as [Rücknahme Ausgleich]
	  ,ltrim(rtrim([Zahlwegzusatz])) as [Zahlwegzusatz]
	  ,ltrim(rtrim([Alternative Kontonummer])) as [Alternative Kontonummer]
	  ,ltrim(rtrim([Finanzstelle])) as [Finanzstelle]
	  ,ltrim(rtrim([Fonds])) as [Fonds]
	  ,ltrim(rtrim([Steuer Buchungskreis])) as [Steuer Buchungskreis]
	  ,ltrim(rtrim([Steuerbasisbetrag HW2])) as [Steuerbasisbetrag HW2]
	  ,ltrim(rtrim([Steuerbasisbetrag HW3])) as [Steuerbasisbetrag HW3]
	  ,ltrim(rtrim([PartnerPrctr])) as [PartnerPrctr]
	  ,ltrim(rtrim([Referenzschlüssel 1])) as [Referenzschlüssel 1]
	  ,ltrim(rtrim([Referenzschlüssel 2])) as [Referenzschlüssel 2]
	  ,ltrim(rtrim([Mittelvormerkung])) as [Mittelvormerkung]
	  ,ltrim(rtrim([Belegposition])) as [Belegposition]
	  ,ltrim(rtrim([Statistischer Steuerbetrag in Belegwaehr])) as [Statistischer Steuerbetrag in Belegwaehr]
	  ,ltrim(rtrim([Funktionsbereich])) as [Funktionsbereich]
	  ,ltrim(rtrim([Org.Position])) as [Org.Position]
	  ,ltrim(rtrim([Negativbuchung])) as [Negativbuchung]
	  ,ltrim(rtrim([Zhlgskartenposition])) as [Zhlgskartenposition]
	  ,ltrim(rtrim([Abrechnungslauf])) as [Abrechnungslauf]
	  ,ltrim(rtrim([Kreditkontr.Bereich])) as [Kreditkontr.Bereich]
	  ,ltrim(rtrim([Zahlungsempf])) as [Zahlungsempf]
	  ,ltrim(rtrim([Referenzschlüssel 3])) as [Referenzschlüssel 3]
	  ,ltrim(rtrim([Weisung 1])) as [Weisung 1]
	  ,ltrim(rtrim([Weisung 2])) as [Weisung 2]
	  ,ltrim(rtrim([Weisung 3])) as [Weisung 3]
	  ,ltrim(rtrim([Weisung 4])) as [Weisung 4]
	  ,ltrim(rtrim([Tätigkeit BE-Steuer])) as [Tätigkeit BE-Steuer]
	  ,ltrim(rtrim([Region])) as [Region]
	  ,ltrim(rtrim([Verteilungsart])) as [Verteilungsart]
	  ,ltrim(rtrim([Zahlung unterwegs])) as [Zahlung unterwegs]
	  ,ltrim(rtrim([Zahlungsreferenz])) as [Zahlungsreferenz]
	  ,ltrim(rtrim([Abgesich.Betrag])) as [Abgesich.Betrag]
	  ,ltrim(rtrim([Inflationsindex])) as [Inflationsindex]
	  ,ltrim(rtrim([Letztes Anpassungsdatum])) as [Letztes Anpassungsdatum]
	  ,ltrim(rtrim([Kontierungstyp])) as [Kontierungstyp]
	  ,ltrim(rtrim([Kontierung])) as [Kontierung]
	  ,ltrim(rtrim([Datum Uebergabe an ger. Mahnverfahren])) as [Datum Uebergabe an ger. Mahnverfahren]
	  ,ltrim(rtrim([Steuerdatum])) as [Steuerdatum]
	  ,ltrim(rtrim([Ausgleichsposition])) as [Ausgleichsposition]
	  ,ltrim(rtrim([Zahlwährung])) as [Zahlwährung]
	  ,ltrim(rtrim([Betrag Zahlwähr])) as [Betrag Zahlwähr]
	  ,ltrim(rtrim([Geschäftsort])) as [Geschäftsort]
	  ,ltrim(rtrim([Quellensteuersektion])) as [Quellensteuersektion]
	  ,ltrim(rtrim([Leistungsart])) as [Leistungsart]
	  ,ltrim(rtrim([Zessionskennzeichen])) as [Zessionskennzeichen]
	  ,ltrim(rtrim([Geschäftsprozeß])) as [Geschäftsprozeß]
	  ,ltrim(rtrim([Realis. Differ.])) as [Realis. Differ.]
	  ,ltrim(rtrim([Realis. Differ..1])) as [Realis. Differ..1]
	  ,ltrim(rtrim([Realis. Differ..2])) as [Realis. Differ..2]
	  ,ltrim(rtrim([Strafzins HW])) as [Strafzins HW]
	  ,ltrim(rtrim([Strafzins 2.HW])) as [Strafzins 2.HW]
	  ,ltrim(rtrim([Strafzins 3.HW.])) as [Strafzins 3.HW.]
	  ,ltrim(rtrim([Strafzins])) as [Strafzins]
	  ,ltrim(rtrim([Verzugstage])) as [Verzugstage]
	  ,ltrim(rtrim([Grund für Verzug])) as [Grund für Verzug]
	  ,ltrim(rtrim([Förderung])) as [Förderung]
	  ,ltrim(rtrim([Steueranteil FI-CA Hauswährung])) as [Steueranteil FI-CA Hauswährung]
	  ,ltrim(rtrim([Funktionsbereich.1])) as [Funktionsbereich.1]
	  ,ltrim(rtrim([Übergabe an Vollstreckung])) as [Übergabe an Vollstreckung]
	  ,ltrim(rtrim([Art der Nebenforderung])) as [Art der Nebenforderung]
	  ,ltrim(rtrim([RE-Immo-Schlüssel])) as [RE-Immo-Schlüssel]
	  ,ltrim(rtrim([Haushaltsprogramm])) as [Haushaltsprogramm]
	  ,ltrim(rtrim([AusglGeschäftsjahr])) as [AusglGeschäftsjahr]
	  ,ltrim(rtrim([PPA Exclude Ind.])) as [PPA Exclude Ind.]
	  ,ltrim(rtrim([Buchungszeile])) as [Buchungszeile]
	  ,ltrim(rtrim([Segment])) as [Segment]
	  ,ltrim(rtrim([Partnersegment])) as [Partnersegment]
	  ,ltrim(rtrim([Partnerfunktionsber])) as [Partnerfunktionsber]
	  ,ltrim(rtrim([Konto-Id])) as [Konto-Id]
	  ,ltrim(rtrim([Kostenart])) as [Kostenart]
	  ,ltrim(rtrim([Ledgergruppenspezifisches Ausgleichen])) as [Ledgergruppenspezifisches Ausgleichen]
	  ,ltrim(rtrim([Belegpositionsnummer für Steuerbeleg])) as [Belegpositionsnummer für Steuerbeleg]
	  ,ltrim(rtrim([Zahlungsdienstleister])) as [Zahlungsdienstleister]
	  ,ltrim(rtrim([Zahlungsref. des Zahlungsdienstleisters])) as [Zahlungsref. des Zahlungsdienstleisters]
	  ,ltrim(rtrim([Mandatsreferenz])) as [Mandatsreferenz]
	  ,ltrim(rtrim([Zahlfreigabe erfolgt])) as [Zahlfreigabe erfolgt]
	  ,ltrim(rtrim([Referenzvorgang])) as [Referenzvorgang]
	  ,ltrim(rtrim([Referenzschlüssel])) as [Referenzschlüssel]
	  ,ltrim(rtrim([LogSystem Ursprung])) as [LogSystem Ursprung]
	  ,ltrim(rtrim([Position.4])) as [Position.4]
	  ,ltrim(rtrim([Position im Sender System])) as [Position im Sender System]
	  ,ltrim(rtrim([Buchungsperiode])) as [Buchungsperiode]
	  ,ltrim(rtrim([Belegstatus])) as [Belegstatus]
	  ,ltrim(rtrim([Buchungsdatum])) as [Buchungsdatum]
	  ,ltrim(rtrim([Belegdatum])) as [Belegdatum]
	  ,ltrim(rtrim([Währung])) as [Währung]
	  ,ltrim(rtrim([Belegart])) as [Belegart]
	  ,ltrim(rtrim([Hauswährung])) as [Hauswährung]
	  ,ltrim(rtrim([Hauswährung 2])) as [Hauswährung 2]
	  ,ltrim(rtrim([Hauswährung 3])) as [Hauswährung 3]
	  ,ltrim(rtrim([Nettofälligkeit])) as [Nettofälligkeit]
	  ,ltrim(rtrim([Skonto 1 Fälligkeit])) as [Skonto 1 Fälligkeit]
	  ,ltrim(rtrim([Skonto 2 Fälligkeit])) as [Skonto 2 Fälligkeit]
	  ,ltrim(rtrim([Datenfilterwert für Data Aging])) as [Datenfilterwert für Data Aging]
	  ,ltrim(rtrim([Bewegungsart.2])) as [Bewegungsart.2]
	  ,ltrim(rtrim([Liquiditätsposition])) as [Liquiditätsposition]
	  ,ltrim(rtrim([Konto Gegenbuchung])) as [Konto Gegenbuchung]
	  ,ltrim(rtrim([Gegenkontoart])) as [Gegenkontoart]
	  ,ltrim(rtrim([Gegenkonto im Hauptbuch])) as [Gegenkonto im Hauptbuch]
	  ,ltrim(rtrim([Vorzeichen der Menge])) as [Vorzeichen der Menge]
	  ,ltrim(rtrim([Unternummer.1])) as [Unternummer.1]
	  ,ltrim(rtrim([Bewegungsart.3])) as [Bewegungsart.3]
	  ,ltrim(rtrim([Bezugsdatum.2])) as [Bezugsdatum.2]
	  ,ltrim(rtrim([Vollabgang])) as [Vollabgang]
	  ,ltrim(rtrim([Buchungsbetrag])) as [Buchungsbetrag]
	  ,ltrim(rtrim([Prozentsatz])) as [Prozentsatz]
	  ,ltrim(rtrim([ZZGEO_LOCATION])) as [ZZGEO_LOCATION]
	  ,ltrim(rtrim([ZZ_LOCATION])) as [ZZ_LOCATION]
	  ,ltrim(rtrim([Dummyfunktion in der Laenge 1])) as [Dummyfunktion in der Laenge 1]
	  ,ltrim(rtrim([Buchungskreis.2])) as [Buchungskreis.2]
	  ,ltrim(rtrim([Aufwands- bzw. Ertragskto im ZBHB])) as [Aufwands- bzw. Ertragskto im ZBHB]
	  ,ltrim(rtrim([Partnerfonds])) as [Partnerfonds]
	  ,ltrim(rtrim([Partnerförderung])) as [Partnerförderung]
	  ,ltrim(rtrim([Budgetperiode])) as [Budgetperiode]
	  ,ltrim(rtrim([Partner Budgtperiode])) as [Partner Budgtperiode]
	  ,ltrim(rtrim([J_1TPBUPL])) as [J_1TPBUPL]
	  ,ltrim(rtrim([Anfang des Leistungserbringungszeitraums])) as [Anfang des Leistungserbringungszeitraums]
	  ,ltrim(rtrim([Ende des Leistungserbringungszeitraums])) as [Ende des Leistungserbringungszeitraums]
	  ,ltrim(rtrim([Knz. für Fast Pay])) as [Knz. für Fast Pay]
	  ,ltrim(rtrim([IGNR_IVREF])) as [IGNR_IVREF]
	  ,ltrim(rtrim([Felder US-Regierung])) as [Felder US-Regierung]
	  ,ltrim(rtrim([HHM-Referenzbelegnummer])) as [HHM-Referenzbelegnummer]
	  ,ltrim(rtrim([HHM-Referenzjahr])) as [HHM-Referenzjahr]
	  ,ltrim(rtrim([HHM-Referenzeinzelposten])) as [HHM-Referenzeinzelposten]
	  ,ltrim(rtrim([HHM-Referenzabfolge der Kontierungen])) as [HHM-Referenzabfolge der Kontierungen]
	  ,ltrim(rtrim([Produktionsmonat])) as [Produktionsmonat]
	  ,ltrim(rtrim([RECRF])) as [RECRF]

    into transform.SAP_Test_Data_BSEG Table
    from import.SAP_Test_Data_BSEG Table
go

select count(1) from transform.SAP_Test_Data_BSEG Table
--

select top 10 * from transform.SAP_Test_Data_BSEG Table
--

