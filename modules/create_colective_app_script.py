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
########################################################################################################################################################################################

#------------------------------------------------------------------------------------------------------------------------------#
###                                                Imports                                                                     #          
###
from datetime import datetime
from importlib.resources import path
import os


### Variables definition:             
###
file_path= os.getcwd()
filename='multi_app.py'
author='Niclas Cramer'
app_folder='apps'
overview_name='overview'

def app_files(filename='.py'):
    name_list = []
    # if __name__=='__main__':
    #     cwd =os.path.normpath(os.getcwd() + os.sep + os.pardir)
    # else:
    cwd = os.getcwd()
    cwd=f'{cwd}\\apps'
    print(cwd)
    
    for root, dirs, files in os.walk(cwd):
        for file in files:
            if file.endswith(filename):
                name_list.append(file)
    return name_list

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

#print(os.getcwd())
def multiple_apps(filename,author,file_path,app_folder,overview_name):
    now = datetime.now()
    date = now.strftime("%d %b %Y %X")
    
    print (f'-----\nCreating App script for {filename}\n')
    script=os.path.join(file_path, filename)  
    print(script)
    #check if the files exists in the processed folder
    fp = open( script, 'w', encoding='utf8') or die ("Could not open file $!") 

    
    # creating the script while writing it in a file
    fp.write('#/*******************************************\n')
    fp.write('#***\n')
    fp.write('#***\n')
    fp.write('#*** Author:	' + author + '\n')
    fp.write('#*** Date:	  ' + date + '\n')
    fp.write('#***\n')
    fp.write('#*** Source:	' + file_path + '\\' + filename + '\n')
    fp.write('#***\n')
    fp.write('#*** Topic:	Automatically generated app script.\n')
    fp.write('#***\n')
    fp.write('#***\n')
    fp.write('#*******************************************/\n\n')


    fp.write('#/******************************************/\n')
    fp.write('#/***              Imports		    	    ***/\n')
    fp.write('#/******************************************/\n\n')

    fp.write("from spyre.server import Site, App\n")


    for app in app_files():
        app_name=app.split('.')[0]
        
        fp.write(f"from {app_folder}.{app_name} import {app_name[4::]}\n")


    fp.write('#/******************************************/\n')
    fp.write('#/***              App Cration		    ***/\n')
    fp.write('#/******************************************/\n\n')

    fp.write('class Index(App):\n')
    fp.write('\tdef getHTML(self, params):\n')
    fp.write('\t\treturn "All Apps"\n\n')
    


    for app in app_files():
        app_name=app.split('.')[0]
        #print(app_name)
        if app_name[4::] == overview_name:
            fp.write(f'site = Site({overview_name})\n')
        else:
            fp.write(f"site.addApp({app_name[4::]}, '/{app_name}')\n")

    fp.write('site.launch(port=8082)\n')
    fp.close()
if __name__=='__main__':
    multiple_apps(filename,author,file_path,app_folder,overview_name)