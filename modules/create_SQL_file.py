### 
### Author:    Niclas Cramer
### Date:      18 June  2022
###
### Function: 
###             1. Creating a SQL import script based on the processed data
##              2. creating new folder sql_files for saving the import scripts 
##              3. counting row count in the processed data file 
## 
## 
## 
## 
###
### 
### Changelog: 
###
###
### Variables definition:
###


author = "Niclas Cramer"

#   path to the place of the file directory 
path = r"processed"  
        # If it is in the place of this script also possible os.getcwd() 

sqlfolder='sql_files'                                       # folder where the import scripts will be saved  
encoding='UTF-8'                                            #encoding of the input file like UTF16-LE, UTF-8 format or ASCII/ Latin-1 or...
countRows = 1                                               #count rows in source file for control totals

datafile = f"SAP_Test_Data_BKPF Table.txt_processed"                            # name of the input file
database = "Test"                             # the destination database (needs to be created before importing)
importSchema = "import"                                     #the destination schema for the file
prepareSchema = "transform"                                 #the preparation schema for the file

table = 'SAP_Test_Data_BKPF'                                              #the destination table name
header = []                                                 # header if needed 
ersteZeile = ""                                                         


charset = "nvarchar"                                        #use nvarchar for unicode (UTF) or varchar if you don't have unicode (ASCII). varchar needs half the space but not recommended 

delimiter = "|"                                             # delimiter in the input file, \\t is tab; /\\\\ is actually "/\"; pipe is automatically escaped, i.e. pipe is "|"

linebreak = "0x0D000A00"                              #linebreak in hex format, ASCII: DOS is 0x0D0A (\r\n); 0x0D is \r; 0x0A is \n (unix); UTF/Unicode: Use, e.g., 0x0D000A00 for \r\n in UTF16LE
firstline = 2                                         #first line with data in it -- if you have one file with a header you need to correct this manually!
codepage = "1252"                                     #1252 is western europe
batchsize = "1000000"      

runall = 1 #nur wenn aalle ime gleichen codierung aber bitte 

########################################################################################################################################################################################

#------------------------------------------------------------------------------------------------------------------------------#
###                                                Imports                                                                     #
from base64 import encode
from datetime import datetime
import re
import os


#------------------------------------------------------------------------------------------------------------------------------#
###                                                Funktions                                                                 ###

# giving a path bath back and creating a folder of the Data
def filepath(filename,foldername):
    if __name__=='__main__':
        d=os.path.normpath(os.getcwd() + os.sep + os.pardir)
    else: 
        d=os.getcwd()
    outdir = d+f'\\{foldername}'
    if not os.path.exists(outdir):
        os.mkdir(outdir)
        #print('Ja')

    return os.path.join(outdir, filename)  

# creating the SQL import file 
def sql(author,path,encoding,datafile,database,importSchema,prepareSchema,charset,delimiter,linebreak,firstline,codepage,batchsize,sqlfolder='sql_files'):
    table=datafile.split('.')[0]
    now = datetime.now()
    date = now.strftime("%d %b %Y %X") 
    countRows = 1  

  

    rowcount = 0        #for control totals!
    columncount = 0

    if 'UTF' in encoding:
        UTF16LE =1
    else:
        UTF16LE =0


    script_split =  datafile.split(".")
    script = "import_" + script_split[0] + ".sql"
    print ('-----\nCreating import script for ' + path + '\\' + datafile + '\n')
    # check if the files exists in the processed folder
    fp = open( filepath(script,sqlfolder), 'w', encoding='utf8') or die ("Could not open file $!") 

    delimiter_escaped = delimiter.replace('|','\|')

    #defining what the linbreak is 
    if(UTF16LE == 1):
        if (linebreak == "0x0D0A"): 
            linebreak = "0x0D000A00"
        elif (linebreak == "0x0A"):
            linebreak = "0x0A00"   
            pass
    SOURCE = open( path + '\\' + datafile, 'r', encoding=encoding) or die ('Could not open file $!')
    
    # check the first row of the file to gain the names of the headers 
    for row in SOURCE:
        ersteZeile = row.replace("\ufeff", "").replace("\n", "")
        header = ersteZeile.split(delimiter)
        break

    for head in header:
        head.strip()

    print ('Header processed...\n')
    print ('Counting data lines for control totals...\n')

    #count rows for control totals
    if(countRows == 1):
        rowcount=sum(1 for line in SOURCE)
        
    # creating the script while writing it in a file
    fp.write('/*******************************************\n')
    fp.write('***\n')
    fp.write('***\n')
    fp.write('*** Author:	' + author + '\n')
    fp.write('*** Date:	  ' + date + '\n')
    fp.write('***\n')
    fp.write('*** Source:	' + path + '\\' + datafile + '\n')
    fp.write('*** Dest.:	' + database + '.' + importSchema + '.' + table + '\n')
    fp.write('***\n')
    fp.write('*** Topic:	Automatically generated import script.\n')
    fp.write('***\n')
    fp.write('***\n')
    fp.write('*******************************************/\n\n')

    fp.write('use ' + database + '\n')
    fp.write('go\n\n')

    fp.write('/******************************************/\n')
    fp.write('/*** Create import schema			    	    ***/\n')
    fp.write('/******************************************/\n\n')

    fp.write("IF NOT EXISTS(select 1 from INFORMATION_SCHEMA.SCHEMATA where SCHEMA_NAME = '" + importSchema + "')\n")
    fp.write('BEGIN\n')
    fp.write("    exec('create schema " + importSchema + "')\n")
    fp.write('END\n\n')

    fp.write('/******************************************/\n')
    fp.write('/*** Create table and insert data	    	***/\n')
    fp.write('/******************************************/\n\n')

    fp.write("IF OBJECT_ID('" + importSchema + "." + table + "','U') IS NOT NULL\n")
    fp.write('drop table ' + importSchema + "." + table + '\n')
    fp.write('go\n\n')

    fp.write('create table ' + importSchema + "." + table + '(\n')

    # creates the import table of the file
    for i in header:
        fp.write('     ')
        if (columncount > 0):
            fp.write(',') 
        else:
            fp.write(' ')
        if (i == ""):
            i = "blank"
        fp.write('[' + str(i) + '] ' + str(charset) + '(255)\n')
        columncount = columncount + 1 
    fp.write(')\n')
    fp.write('go\n\n')


    fp.write('--insert the data\n')

    fp.write('BULK INSERT ' + importSchema +'.'+ table + '\n')

    fp.write("    FROM '" + path + "\\" + datafile + "'\n")
    fp.write('    WITH\n')
    fp.write('    (\n')
    fp.write('        FIRSTROW = ' + str(firstline) + ',\n')
    fp.write('        MAXERRORS = 0,			--no errors allowed\n')
    fp.write("        FIELDTERMINATOR = '" + delimiter + "',\n")
    fp.write("        ROWTERMINATOR = '" + linebreak + "',\n")


    if (UTF16LE == 1):
        fp.write("        DATAFILETYPE = 'widechar',\n")
    else:
        fp.write('        CODEPAGE = ' + codepage + ',\n')

    fp.write('        BATCHSIZE = ' + batchsize + '\n')
    fp.write('    )\n')
    fp.write('go\n\n')


    fp.write('/******************************************/\n')
    fp.write('/*** Control totals / Quality checks	***/\n')
    fp.write('/******************************************/\n\n')

    fp.write('select COUNT(1) from ' + importSchema + '.' + table + '\n')
    fp.write('--\n')
    fp.write('--expected: "' + str(rowcount) + '"\n\n')

    fp.write('select top 10 * from ' + importSchema + '.' + table + '\n')
    fp.write('--\n\n')


    fp.write('--The next line checks for exact duplicates, can take a long time!\n')
    fp.write('select count(1) from (select distinct * from ' + importSchema + '.' + table + ') temp\n')
    fp.write('--\n\n')



    fp.write("--Remember to check the primary key! Sorry, the script didn't know the primary key\n")
    fp.write('select distinct [KEY_COLUMNS] from ' + importSchema + '.' + table + '\n')



    fp.write('--\n\n')

    columncount = 0
    for i in header:

        fp.write("select distinct top 20 ltrim(rtrim([" + i + "])) from " + importSchema + "." + table + "         --\n")
        columncount = columncount + 1


    fp.write('\n\n\n')

    fp.write('/******************************************/\n')
    fp.write('/*** Create prepare schema				***/\n')
    fp.write('/******************************************/\n\n')


    fp.write("IF NOT EXISTS(select 1 from INFORMATION_SCHEMA.SCHEMATA where SCHEMA_NAME = '" + prepareSchema + "')\n")
    fp.write('BEGIN\n')
    fp.write("	exec('create schema " + prepareSchema + "')\n")
    fp.write('END\n\n')


    fp.write('/******************************************/\n')
    fp.write('/*** Prepare the data					***/\n')
    fp.write('/******************************************/\n\n')


    fp.write("IF OBJECT_ID('" + prepareSchema + "." + table + "','U') IS NOT NULL\n")
    fp.write('drop table ' + prepareSchema + '.' + table + '\n')
    fp.write('go\n\n')

    fp.write('select\n')

    columncount = 0

    for i in header:
        fp.write('\t')
        if (columncount > 0):
            fp.write('  ,') 
        else:
            fp.write('   ')
        fp.write("ltrim(rtrim(["+ i + "])) as ["+ i + "]\n")
        columncount = columncount + 1 

    fp.write('\n')
            

    fp.write('    into ' + prepareSchema + '.' + table + '\n')
    fp.write('    from ' + importSchema + '.' + table + '\n')

    fp.write('go\n\n')

    fp.write('select count(1) from ' + prepareSchema + '.' + table + '\n')
    fp.write('--\n\n')

    fp.write('select top 10 * from ' + prepareSchema + '.' + table + '\n')
    fp.write('--\n\n')
                
    print ('\nScript name: ' + path + '\\' + script + '\n')
    print ('\nDone.\n')
    print ('-----\n')


    fp.close()
    SOURCE.close()

    print ("\n")

if __name__=='__main__':
    sql(author,path,encoding,datafile,database,importSchema,prepareSchema,charset,delimiter,linebreak,firstline,codepage,batchsize,sqlfolder=sqlfolder)
