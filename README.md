*Usage:*
before execution of the script execute following lines if not already satisfied  
    pip install
    pip install -r requirements.txt

**to run the script**
- copy raw data into the "RawData" folder
- you get this folder structure:

        - modules 
            - converter.py
            - create_SQL_file.py
        - RawData --> saving the raw data files into this folder
        - _Readme.txt
        - requirements.txt

- navigate to the config.py file or open it in a notepad or VSC/ Pycharm and edit the variables
- execute the script in VSC/ Pycharm 
or navigate with the cmd to the folder where the config.py file with: python3 config.py or config.py



**Folder structure after execution**

- Logging_files
- modules
    - converter.py
    - create_SQL_file.py
- processed --> contains the processed files 
- RawData
- sql_files --> contains the sql import scripts
- _Readme.txt
- requirements.txt

*overview*

use config.py to execute both scripts 

    ---------------converter.py ---------------------------
    Pre-processed the csv or txt file with converter.py script
    Identified lines with too many column separators 
    Deleted those extra semicolons and saved file to processed - MANUALLY! based on file.txt in the Logging_files folder:
    --replaced quotation marks and values which represent an empty value 
    --creates an overview of the data in the logging folder

    --------------create_SQL_file.py -----------------------
    Created SQL import script with create_SQL_file.py
    Generated script can be used to import to SQL db (DB must  be created first)
