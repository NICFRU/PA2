### Author:    Niclas Cramer
### Date:      18 June  2022
### 
### Function: 
###            1. Converting a raw data file into a processed file  
##             2. Converting multiple files is possible         
##             3. Control if each row has the correct number of separations     
##             4. Replacing or skipping but counting of values which represent an empty value like NaN           
##             5. Replacing BOM           
##             6. Creates a logging file             
##             7. Creates automatic a folder structure for processed and logging files  
###            8. Creates out of the processed file sql import files 
###            
### Changelog:     
###

### The script can also "work" on the input file, i. e. omit lines that do not contain data, replace strings with other strings, etc.
### (go to the lines below and change it...)

###
### Variables definition:
###

#----------------------------------------------------------------------for converter.py--------------------------------------------------------------------#
author = "Niclas Cramer"

files=1                                   #the input file can be a single file (0) or a bunch of files (1)

file='SAP_Test_Data_GLT0 Table.XLSX'                    # if input file is be a single file when files=0

file_extension='.XLSX'                       # if input are a bunch of files that will be executed files=1
# -------------- general definitions ---------------------- # 

startingfile='RawData'                      # Defines the folder where the raw data is located   
new_format ='txt_processed'                 # new data format
processedfoldername='processed'             # Folder where the processed files will be saved

encoding= 'UTF-8'                         # encoding of the file, like UTF-8, Latin-1 or UTF-16
end_encoding='UTF-8'                      # not recommended to have different encoding than start encoding

sepertator='|'                              # separator of the file
new_separator='|'                           # new separator  of the file
replace_separator=';'                       # if the new and old separator are different, replaces the new separator which is already existing in data if necessary with other symbol

withheader=1                                # If the file has already a header=1 if not =0 
header=[]                                   # add header if withheader=0
text_qualifier=''                         # if the TXT file has a text qualifier


# replacing or skipping of values
replace_double_quotes=1                     #to replace the inverted comma '"' globally, counts the number of replacements
null_values=['#VALUE!', '#DIV/0!','#N/A']   #to replace values which represent a empty value globally, counts the number of replacements
skiped_values=['#VALUE!', '#DIV/0!','#N/A'] # counts globally the number of skipped elements


#----------------------------------------------------------------------for create_SQL_file.py--------------------------------------------------------------------#
sql_folder='sql_files'                     # folder where the SQL are saved               
database = "[DU00545_Worx_SRC]"             # Database Name 
importSchema = "import"                     # schema of the raw data
prepareSchema = "transform"                 # schema of the transformed data

charset = "nvarchar"                        # how the elements are saved 

linebreak = "0x0D000A00"                    #linebreak in hex format, ASCII: DOS is 0x0D0A (\r\n); 0x0D is \r; 0x0A is \n (unix); UTF/Unicode: Use, e.g., 0x0D000A00 for \r\n in UTF16LE
firstline = 2                               #first line with data in it -- if you have one file with a header you need to correct this manually!
codepage = "1252"                           #1252 is western europe
batchsize = "1000000"      




########################################################################################################################################################################################


#------------------------------------------------------------------------------------------------------------------------------#
###                                                Imports                                                                     #
import modules.converter as c
import modules.create_SQL_file as csf
import modules.overall_funktions as f
import logging
import logging.config
import os



#------------------------------------------------------------------------------------------------------------------------------#
###                                                Funktions                                                                 ###

# executes the creation of the SQL script
def trysql(author,path,encoding,datafile,database,importSchema,prepareSchema,charset,new_separator,linebreak,firstline,codepage,batchsize,sql_folder):
    try:
        #executing the SQL script
        csf.sql(author,path,encoding,datafile,database,importSchema,prepareSchema,charset,new_separator,linebreak,firstline,codepage,batchsize,sql_folder)
        name=datafile.split('.')[0]
        logger.info('---------------------------------------------------------------------------')
        logger.info(f'created SQL File {name}.sql')
        print(f'created SQL File {name}.sql')
        logger.info('---------------------------------------------------------------------------')
        logger.info("\n")
        #if an error arises it will be logged, like the file does not exists 
    except FileNotFoundError:
        logger.error(f'The File {datafile} was not found and hase a problem or does not exists')
        print(c.color.BOLD +f'The File {datafile} was not found and hase a problem or does not exists'+c.color.END)
    except OSError as err:
         print("OS error: {0}".format(err))
         logger.error("OS error: {0}".format(err))
    #     logger.error("OS error: {0}".format(err))
    except ValueError as err:
    #     # if the number of seperations is wrong
        print("OS error: {0}".format(err))
        logger.error("OS error: {0}".format(err))
    #     logger.error("OS error: {0}".format(err))
    except BaseException as err:
        logger.error(f"Unexpected {err=}, {type(err)=}")
        print(f"Unexpected {err=}, {type(err)=}")
    #     logger.error(f"Unexpected {err=}, {type(err)=}")
        #raise

#creting the logger file for the files and remove the old one if one exists
def deflogger(logging_file_name):
    if os.path.exists(logging_file_name):
        os.remove(logging_file_name)
    
    global logger
    # Create the logging file and the conection to the logging file
    logger = logging.getLogger(logging_file_name)
    logger.setLevel(logging.DEBUG)
    fh = logging.FileHandler(logging_file_name)
    fh.setLevel(logging.DEBUG)
    logger.addHandler(fh)


folder_data=os.getcwd()+f'\\{startingfile}'
folder_processed=os.getcwd()+f'\\{processedfoldername}'
d=os.getcwd()
loggingfilepath = d+f'\\Logging_files'
if not os.path.exists(loggingfilepath):
    os.mkdir(loggingfilepath)
xlsx=0
#------------------------------------------------------------------------------------------------------------------------------#
###                                                execution                                                                 ###

#executes the funktions for multiple files
if files==1:
    for file in c.get_file_name(filename=file_extension):
        logging_file_name=loggingfilepath+'\\'+file.split('.')[0] + '.log'
        pathnew=folder_data+f'\\{file}'
        deflogger(logging_file_name)
        if 'XLSX' in pathnew.upper():
            pathnew=f.XLSX_to_csv(pathnew)
            file=file.replace('XLSX', 'csv')
            xlsx=1
        error=c.transform_into_csv(pathnew, c.line_count(pathnew,separator=sepertator,encoding=encoding), endencoding=end_encoding, separator=sepertator, seper=new_separator, encode=encoding, new_format='txt_processed',withheader=withheader,header=header,quotechar=text_qualifier,replace_double_quotes=replace_double_quotes,replace_new_separator=replace_separator,logging_file_name=logging_file_name,processedfoldername=processedfoldername,null_values=null_values,skiped_values=skiped_values,xlsx=xlsx)
        file=file.split('.')[0] + '.' + new_format.split('.')[len(new_format.split('.'))-1]
        print(error)
        if error==0:
            trysql(author,folder_processed ,encoding,file,database,importSchema,prepareSchema,charset,new_separator,linebreak,firstline,codepage,batchsize,sql_folder)
        else:
            pass
### for individual files 
else:
    logging_file_name=loggingfilepath+'\\'+file.split('.')[0] + '.log'
    pathnew=folder_data+f'\\{file}'
    deflogger(logging_file_name)
    if 'XLSX' in pathnew.upper():
        pathnew=f.XLSX_to_csv(pathnew)
        file=file.replace('XLSX', 'csv')
        xlsx=1
    error=c.transform_into_csv(pathnew, c.line_count(pathnew,separator=sepertator,encoding=encoding), endencoding=end_encoding, separator=sepertator, seper=new_separator, encode=encoding, new_format='txt_processed',withheader=withheader,header=header,quotechar=text_qualifier,replace_double_quotes=replace_double_quotes,replace_new_separator=replace_separator,logging_file_name=logging_file_name,processedfoldername=processedfoldername,null_values=null_values,skiped_values=skiped_values,xlsx=xlsx)
    file=file.split('.')[0] + '.' + new_format.split('.')[len(new_format.split('.'))-1]
    print(error)
    if error==0:
        trysql(author,folder_processed ,encoding,file,database,importSchema,prepareSchema,charset,new_separator,linebreak,firstline,codepage,batchsize,sql_folder)
    else:
        pass
