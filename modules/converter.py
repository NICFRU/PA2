### Author:    Niclas Cramer
### Date:      4 November   2022
### 
### Function: 
###            1. Converting a raw data file into a processed file  
##             2. Converting multiple files is possible         
##             3. Control if each row has the correct number of separations     
##             4. Replacing or skipping but counting of values which represent an empty value like NaN           
##             5. Replacing BOM           
##             6. Creates a logging file             
##             7. Creates automatic a folder structure for processed and logging files  
###            
### Changelog:              
###            
###

### The script can also "work" on the input file, i. e. omit lines that do not contain data, replace strings with other strings, etc.
### (go to the lines below and change it...)

###
### Variables definition:
###



files=0                                   #the input file can be a single file (0) or a bunch of files (1)

file='SAP_Test_Data_BKPF Table.XLSX'                    # if input file is be a single file when files=0

file_extension='.txt'                       # Extension which identifies files that will be executed if files = 1
# -------------- general definitions ---------------------- # 

startingfile='RawData'                      # Defines the folder where the raw data is located   
new_format ='txt_processed'                 # new data format
processedfoldername='processed'             # Folder where the processed files will be saved

encoding= 'UTF-8'                         # encoding of the file, like UTF-8, Latin-1 or UTF-16 of the file
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




#! Dont change something below here 
########################################################################################################################################################################################

#------------------------------------------------------------------------------------------------------------------------------#
###                                                Imports                                                                     #
import os
import pandas as pd
import logging
import numpy as np
import csv
import re
import codecs
from time import perf_counter
if __name__=='__main__':
    import overall_funktions as f
else:
    import modules.overall_funktions as f


#------------------------------------------------------------------------------------------------------------------------------#
###                                                Funktions                                                                 ###

# changing the path of the terminal
def filepath(filename, foldername):
    if __name__ == '__main__':
        #print(os.path.dirname(__file__))
        d = os.path.normpath(os.path.dirname(__file__) + os.sep + os.pardir)
        #print('Ja: ',d)
    else:
        d = os.getcwd()
        #print('Nein: ',d)
    outdir = d+f'\\{foldername}'
    if not os.path.exists(outdir):
        os.mkdir(outdir)
        #print('Ja')

    # returning of a different path and adding a filename to the path
    return f'{outdir}\\{filename}'


# a Class to have a bold text in the output
class color:
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'
    END = '\033[0m'

# searching for all files with the same extension


def get_file_name(filename='.txt'):
    name_list = []
    cwd = os.getcwd()
    for root, dirs, files in os.walk(cwd):
        for file in files:
            if file.endswith(filename):
                name_list.append(file)
    return name_list

# returning the row, where the separator first appears


def line_count(file, separator='|', encoding='utf-8'):
    file = open(file, "r", encoding=encoding)
    line_count = 0
    for line in file:
        if line != "\n":
            if separator in line:
                break
            line_count += 1
    file.close()
    return line_count

# Trimming of whitespace in the data frame


def trim_all_columns(df):
    df = df.replace(r'^\s*$', np.nan, regex=True)
    df.columns = df.columns.str.strip()
    def trim_strings(x): return x.strip() if isinstance(x, str) else x
    return df.applymap(trim_strings)

# examine where the header starts


def check_beginnig_rows(file, separator='|', encoding='utf-8'):
    check = '--------'
    x = line_count(file, encoding=encoding, separator=separator)
    file2 = open(file, "r", encoding=encoding)
    file3 = file2.readlines()[x:]
    x = 0
    for line in file3:
        if check in line:
            #print (line)
            file2.close()
            return x
        x += 1
    return line_count(file, separator, encoding=encoding)+1


# counting of the rows in the raw data file
def count_line(file, separator='|', encoding='utf-8', withheader=1):
    start = check_beginnig_rows(file, separator=separator, encoding=encoding)
    #print(start)
    file2 = open(file, "r", encoding=encoding)
    #print(file2.readlines()[6:8])
    count = 0
    count = sum(1 for line in file2)
    if count == start-withheader:
        count -= 1

    else:
        count -= start
    if withheader == 0:
        count += 1
    file2.close()
    return count

# returns rows which are x % empty


def end_seperation(df, rows):
    lots_of_Null_Values = df.isnull().mean(axis=1).lt(0.8)
    List_of_rows_which_are_Null = [
        x+1 for x in range(rows) if lots_of_Null_Values[x] == False]
    return List_of_rows_which_are_Null

# replaces quotation marks and counting them


def replacing_of_quotes(df, replace_double_quotes):
    pattern = re.compile(r"\"[^\"]*\"")
    count = 0

    for i, row in df.iterrows():
        column = 0
        for element in row:
            if isinstance(element, str):
                if pattern.findall(element):
                    if replace_double_quotes == 1:
                        df.at[i, df.columns[column]] = element.replace('"', '')
                    count += 1
            column += 1
    #print(count)
    return count

#replaces boom


def replace_BOM(file, encoding):
    file_open = open(file, encoding=encoding)
    raw = file_open .read()
    file_open .close()
    if raw.startswith(codecs.BOM_UTF8):
        raw = raw.replace(codecs.BOM_UTF8, '', 1)


# checks if the encoding has a BOM or other encoding keys. Then it will open the file with it and delete the possible BOM
def detect_by_bom(path, default):
    boom = 0
    with open(path, 'rb') as f:
        raw = f.read(4)    # will read less if the file is smaller
    # BOM_UTF32_LE's start is equal to BOM_UTF16_LE so need to try the former first
    for enc, boms in \
            ('utf-8-sig', (codecs.BOM_UTF8,)), \
            ('utf-16', (codecs.BOM_UTF16_LE, codecs.BOM_UTF16_BE)), \
            ('utf-32', (codecs.BOM_UTF32_LE, codecs.BOM_UTF32_BE)):
        if any(raw.startswith(bom) for bom in boms):
            boom = 1
            return enc, boom
    return default, boom

# counts and replaces a value while iterating over each row


def replace_and_count(df, value, replace_value, null_values):
    zahl_column = len(df.columns)
    count = 0
    replaced = 0
    for i, row in df.iterrows():
        if value in row.tolist():
            for x in range(0, zahl_column):
                if row[x] == value:
                    if value not in null_values:
                        df.at[i, df.columns[x]] = replace_value
                        replaced = 1
                    count += 1
    if value not in null_values:
        replaced = 1
    return count, replaced

# initial funktion, which starts the transformation into a csv file


def transform_into_csv(file, skiprow, endencoding, quotechar, separator='|', withheader=1, header='', seper='|', encode='latin-1', new_format='txt_processed', replace_double_quotes=0, replace_new_separator=';', logging_file_name='', processedfoldername='processed', null_values=['#VALUE!', '#DIV/0!'], skiped_values=['#VALUE!', '#DIV/0!'], xlsx=0,timedf='timedf'):
    start = perf_counter()
    if __name__ != '__main__':
        #if config.py executed, connecting to the logging file
        logger = logging.getLogger(logging_file_name)
    else:
        ###         Logging File creation if this file will be separately executed        ###
        filename_log = file.split('\\')[-1]
        filename_log = filename_log.split('.')[0]

        loggingfilepath = filepath(
            filename=filename_log, foldername='Logging_files')
        loggingfilepath = loggingfilepath+'.log'
        # Check if the Log file Exists and and delete it if it exists
        if os.path.exists(loggingfilepath):
            os.remove(loggingfilepath)

        logger = logging.getLogger(loggingfilepath)
        logger.setLevel(logging.DEBUG)
        fh = logging.FileHandler(loggingfilepath)
        fh.setLevel(logging.DEBUG)
        logger.addHandler(fh)

    logger.info('-'*80)
    filename = file.split('\\')[-1]
    short_filename = filename.split('.')[0]

    if xlsx:
        logger.info(f'Processing: "{filename[:-4]}.XLSX"')
        logger.info('IS a XLSX file needs first to converted to CSV')
        logger.info('Use/created csv file for processing')
        logger.info(f'End Processing: "{filename[:-4]}.XLSX"')
        logger.info(f'Start Processing: "{filename}"')
    else:
        logger.info(f'Processing: "{filename}"')
    # if the data has no problems like, seperation error the data gets transformed
    try:
        encoding, boom = detect_by_bom(file, encode)
        # reading of the data and creating a dataframe
        if withheader == 1:
            df = pd.read_csv(file, sep=separator, skiprows=skiprow, encoding=encoding, dtype=str,
                             quotechar=quotechar, skipinitialspace=True, keep_default_na=False, na_values=[''])
        else:
            df = pd.read_csv(file, sep=separator, skiprows=skiprow, encoding=encoding, header=None, names=header,
                             dtype=str, quotechar=quotechar, skipinitialspace=True, keep_default_na=False, na_values=[''])

        # calling function for replacing and counting quotation marks
        replace_count = replacing_of_quotes(df, replace_double_quotes)

        #deletes columns if they do not have a name (specific for SAP Data)
        df = df.loc[:, ~df.columns.str.contains('^Unnamed')]

        # counting number of separations in the header row
        seperations = number_in_first_line(file, separator, encoding=encode)

        # counts the rows in the original file
        count = count_line(file, separator=separator,
                           encoding=encoding, withheader=withheader)

        #counts the number of rows in the processed file
        check = df.isna().sum()[0]+df[df.columns[0]].count()

        #  trims the spaces left and right of the entities
        df = trim_all_columns(df)

        #replaces in entities the new separator if they have one
        if seper == "|":
            df = df.replace("\|", replace_new_separator, regex=True)
        else:
            df = df.replace(seper, replace_new_separator)

        #  Values which represent an empty value
        replace_values = ['-1.#IND', '1.#QNAN', '1.#IND', '-1.#QNAN', '#N/A N/A', '#N/A', 'N/A',
                          'n/a', 'NA', '#NA', 'NULL', 'null', 'NaN', '-NaN', 'nan', '-nan', '#VALUE!', '#DIV/0!', '00']

        for x in null_values:
            if x not in replace_values:
                replace_values.append(x)
        for x in skiped_values:
            if x not in replace_values:
                replace_values.append(x)

        # inserts into the logging file information about the file, like separation, row count, rows which are almost empty
        logger.info(f'Number of seperations: {seperations}')
        logger.info(f'Finished: "{filename}"')

        def if_op(bed, val1):
            if val1 == bed:
                return 'skipped'
            else:
                return 'replaced'
        replaced_counted_00, replaced_00 = replace_and_count(
            df, "00", '', skiped_values)
        replaced_counted_Na, replaced_Na = replace_and_count(
            df, '#N/A', '', skiped_values)
        replaced_counted_D0, replaced_D0 = replace_and_count(
            df, '#DIV/0!', '', skiped_values)
        logger.info(f'Statistics:	Processed lines:	{check}	skipped lines:	{skiprow}	replaced BOM:	{boom}	{if_op(0,replace_double_quotes)} ":{replace_count}	{if_op(0,replaced_00)} "00" bytes:	{replaced_counted_00}	{if_op(0,replaced_Na)} values #N/A:	{replaced_counted_Na}	{if_op(0,replaced_D0)} values #DIV/0!:	{replaced_counted_D0}	header found:	yes')
        logger.info('\n')
        logger.info('=============== Statistics ===============')
        logger.info('Total processed files: 	1')
        logger.info(f'Processed lines:	{check}')
        logger.info(f'Total skipped lines: {skiprow}')
        for x in replace_values:
            replaced_counted, replaced = replace_and_count(
                df, x, '', skiped_values)
            if replaced == 1:
                logger.info(f'Total replaced {x}:  {replaced_counted}')
            else:
                logger.info(f'Total skipped  {x}:  {replaced_counted}')
        logger.info(f'replaced BOM:	{boom}')
        logger.info(
            f'Number of lines in the TXT File after the header: {count}')
        logger.info(f'Number of elements in the processed file: {check}')
        logger.info(f'Total replaced ": {replace_count}')

        # Delete and list of rows which are completly empty
        lots_of_Null_Values = df.isnull().mean(axis=1).lt(1)
        List_of_rows_which_got_replaced = [
            x+1 for x in range(0, len(lots_of_Null_Values)) if lots_of_Null_Values[x] == False]

        df = df[~df.isnull().mean(axis=1).lt(1) < 1].reset_index(drop=True)

        #lots_of_Null_Values_2=df.isnull().mean(axis=1).lt(0.8) # list of True and False Values where mean of the Null entities is greater than 0.8
        #list of the rows where lots of entities are NULL
        #List_of_rows_which_are_Null=[x+1 for x in range(0,len(lots_of_Null_Values_2)) if lots_of_Null_Values_2[x]==False]

        logger.info(f'Deleted lines : {List_of_rows_which_got_replaced}')
        df.to_csv(filepath(f'{short_filename}.{new_format}', processedfoldername),
                  index=False, header=True, sep=seper, encoding=endencoding)
        #logger.info(f'Rows which have lot of empty elements and should be checked in the new file: {List_of_rows_which_are_Null}')
        logger.info(f'End of logging the file, without problems: "{filename}"')
        end = perf_counter()
        duration=end - start
        if __name__ != '__main__':
            list_row = [filename, 'process', duration]
            timedf.loc[len(timedf)] = list_row
        logger.info(f'Duration of "{filename}" for processsing: {duration} seconds')
        logger.info(
            '---------------------------------------------------------------------------')
        logger.info("\n")
        return 0,timedf
    # in the event of an error
    except FileNotFoundError:
        logger.error('Move Data to the Data folder')
        print(color.BOLD + 'Move Data to the Data folder'+color.END)
    except OSError as err:
        print("OS error: {0}".format(err))
        logger.error("OS error: {0}".format(err))
    except ValueError as err:
        # if the number of seperations is wrong
        #logger.error("OS error: {0}".format(err))

        return check_number_of_seperations(file, number_in_first_line(file, separator=separator, encoding=encode), encoding=encode, separator=sepertator, filename=filename, skiprow=skiprow, logger=logger,start=start,timedf=timedf)
    except BaseException as err:
        print(f"Unexpected {err=}, {type(err)=}")
        logger.error(f"Unexpected {err=}, {type(err)=}")
        raise
#

#----------------------------------------------------------------------Checks when an error occurs --------------------------------------------------------------#

# checks how many seperations we have in the header if there is no error


def number_in_first_line(file, separator='|', encoding='utf-8'):
    file2 = open(file, "r", encoding=encoding)
    row, row_num = line_count1(file2, separator)
    num = row.count(separator)
    file2.close()
    return num

# processing of the file if an error accrues


def check_number_of_seperations(file2, number, filename, logger, separator='|', encoding='utf-8', skiprow=4,start=0,timedf=''):
    zahl = line_count(file2, separator, encoding=encoding)
    encoding, boom = detect_by_bom(file2, encoding)
    file = open(file2, "r", encoding=encoding)
    row, num = line_count1(file, separator)
    file3 = file.readlines()[zahl:]
    line_number = 0
    for line in file3:
        line_number += 1
    x = num

    print("\n")
    print('---------------------------------------------------------------------------')
    print(f'{filename}')
    print(f'Number of seperations: {number}')
    # creates the insert in the log file
    logger.info(f'Number of seperations: {number}')
    #checks each row if the number of seperations is not equal to the header and makes a log entry
    for line in file3:
        if line.count(separator) != number:
            logger.info(
                f'Wrong number of seperations, in line {x} ({str(line.count(separator))} instead of {number}): ' + line)
            print(f'Wrong number of seperations, in line {x} with: ' + color.BOLD + str(
                line.count(separator)) + color.END + ' seperation')

        x += 1

    logger.info('=============== Statistics ===============')
    logger.info('Total processed files: 	1')
    logger.info(f'Processed lines:	{line_number+1}')
    logger.info(f'Total skipped lines: {skiprow}')
    logger.info(f'replaced BOM:	{boom}')
    #logger.info(f'Rows which have lot of empty elements and should be checked in the new file: {List_of_rows_which_are_Null}')

    logger.info(f'End of logging the file, with problems: "{filename}"')
    end = perf_counter()
    duration=end - start
    if __name__ != '__main__':
        list_row = [filename, 'process_error', duration]
        timedf.loc[len(timedf)] = list_row
    logger.info(f'Duration of "{filename}" for processsing: {duration} seconds')
        
    logger.info(
        '---------------------------------------------------------------------------')
    logger.info("\n")

    print('---------------------------------------------------------------------------')

    file.close()
    error = 1
    return error,timedf

# check where the header starts


def line_count1(file, separator='|'):
    line_count = 1
    for line in file:
        if line != "\n":
            line_count += 1
            if separator in line:

                break
    return line, line_count


#------------------------------------------------------------------------------------------------------------------------------#


# Script processing
if __name__ == '__main__':

    xlsx = 0
    if files == 1:
        # execution of all files
        for file in get_file_name(filename=file_extension):
            pathnew = filepath(fr'{file}', startingfile)
            if 'XLSX' in pathnew.upper():
                pathnew = f.XLSX_to_csv(pathnew)
                file = file.replace('XLSX', 'csv')
                xlsx = 1

            transform_into_csv(pathnew, line_count(filepath(fr'{file}', startingfile), separator=sepertator, encoding=encoding), endencoding=end_encoding, separator=sepertator, seper=new_separator, encode=encoding, new_format='txt_processed', withheader=withheader,
                               header=header, quotechar=text_qualifier, replace_double_quotes=replace_double_quotes, replace_new_separator=replace_separator, processedfoldername=processedfoldername, null_values=null_values, skiped_values=skiped_values, xlsx=xlsx)

    ### for individual files
    else:

        pathnew = filepath(fr'{file}', startingfile)
        if 'XLSX' in pathnew.upper():
            pathnew = f.XLSX_to_csv(pathnew)
            file = file.replace('XLSX', 'csv')
            xlsx = 1
        transform_into_csv(pathnew, line_count(filepath(fr'{file}', startingfile), separator=sepertator, encoding=encoding), endencoding=end_encoding, separator=sepertator, seper=new_separator, encode=encoding, new_format='txt_processed', withheader=withheader,
                           header=header, quotechar=text_qualifier, replace_double_quotes=replace_double_quotes, replace_new_separator=replace_separator, processedfoldername=processedfoldername, null_values=null_values, skiped_values=skiped_values, xlsx=xlsx)


else:

    logger = logging.getLogger(__name__)
## for muliple files
