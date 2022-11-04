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

files=0                                                 #the input file can be a single file (0) or a bunch of files (1)

file='SAP_Test_Data_BKPF Table.txt_processed'           # name if the single file 

path = "processed"                                      #   path/ folder where the input data is located


app_folder='app'                                        # folder where the import scripts will be saved  
file_extension='txt_processed'                          #  Extension which identifies files that will be executed if files = 1
author='Niclas Cramer'
files=0                                                 #the input file can be a single file (0) or a bunch of files (1)




########################################################################################################################################################################################

#------------------------------------------------------------------------------------------------------------------------------#
###                                                Imports                                                                     #
from base64 import encode
from datetime import datetime
import re
import os
from sys import platform
if __name__=='__main__':
    import overall_funktions as f
else:
    import modules.overall_funktions as f


#------------------------------------------------------------------------------------------------------------------------------#
###                                                Funktions                                                                 ###

# giving a path bath back and creating a folder of the Data
def filepath(filename,foldername):
    if __name__=='__main__':
        d=os.path.normpath(os.getcwd() + os.sep + os.pardir)
    else: 
        d=os.getcwd()
    slash=f.platforming()
    outdir = d+f'{slash}{foldername}'
    if not os.path.exists(outdir):
        os.mkdir(outdir)
        #print('Ja')

    return os.path.join(outdir, filename)  

# creating the SQL import file 
def app_generator(author,path,file,app_folder='apps'):
    
    now = datetime.now()
    date = now.strftime("%d %b %Y %X")
    pathnew = filepath(fr'{file}', app_folder)
    if platform == 'win32':
        pathnew=pathnew.replace("\\",'\\\\')
    script_split =  file.split(".")
    name=script_split[0].replace(" ","_")
    script = "app_" + name + ".py"
    slash=f.platforming()
    print ('-----\nCreating App script for ' + path + slash + file + '\n')
    print(filepath(script,app_folder))
    #check if the files exists in the processed folder
    fp = open( filepath(script,app_folder), 'w', encoding='utf8') or die ("Could not open file $!") 

    
    # creating the script while writing it in a file
    fp.write('#/*******************************************\n')
    fp.write('#***\n')
    fp.write('#***\n')
    fp.write('#*** Author:	' + author + '\n')
    fp.write('#*** Date:	  ' + date + '\n')
    fp.write('#***\n')
    fp.write('#*** Source:	' + path + slash + file + '\n')
    fp.write('#***\n')
    fp.write('#*** Topic:	Automatically generated app script.\n')
    fp.write('#***\n')
    fp.write('#***\n')
    fp.write('#*******************************************/\n\n')


    fp.write('#/******************************************/\n')
    fp.write('#/***              Imports		    	    ***/\n')
    fp.write('#/******************************************/\n\n')

    fp.write("from spyre import server\n")
    fp.write('import pandas as pd\n')
    fp.write("from math import pi\n")
    fp.write("from sys import platform\n")
    fp.write('import modules.overall_funktions as of\n\n')

    fp.write('#/******************************************/\n')
    fp.write('#/***            Bokeh imports    	***/\n')
    fp.write('#/******************************************/\n\n')

    fp.write('from bokeh import plotting\n')
    fp.write('from bokeh.transform import cumsum, dodge\n')
    fp.write('from bokeh.plotting import figure,save\n')
    fp.write('from bokeh.resources import CDN\n')
    fp.write('from bokeh.embed import file_html\n')
    fp.write('from bokeh.models import ColumnDataSource,HoverTool\n')
    fp.write('import copy\n\n')



    fp.write('#/******************************************/\n')
    fp.write('#/*** Create the app    	***/\n')
    fp.write('#/******************************************/\n\n')

    fp.write("server.include_df_index = True\n")
    fp.write(f'class {name}(server.App): \n')
    fp.write(f'\tif platform =="darwin":  \n')
    fp.write(f'\t\tlink = "processed/{file}"\n')
    fp.write(f'\telif platform =="win32":  \n')
    fp.write(f'\t\tlink = "processed\\\\{file}"\n')
    fp.write(f'\ttitle = "Overview of the Table {name}"\n')
    fp.write(f"\tinputs = [dict(type= 'dropdown',label= 'Inputs',options= of.columns(link),value= 'BSEG',key= 'values',action_id= 'update_data')]\n\n")
    
    fp.write(f'\tcontrols = [dict(type= "button",id= "update_data",label= "reload the data")]\n')
    fp.write(f'\ttabs = ["Table","Overview_of_the_Table","Grafical_Overview"]\n')
    fp.write(f'''\toutputs = [dict(type= "table",id= "datahead",control_id= "update_data",tab= "Table",sortable=True,on_page_load= True),
        dict(type= "table",id= "description",control_id= "update_data",tab= "Overview_of_the_Table",sortable=True,on_page_load= True),
        dict(type= "html",id= "description_plot",control_id= "update_data",tab= "Grafical_Overview",sortable=True,on_page_load= True),
        dict(output_type= "html",id= "unique",control_id= "update_data",tab= "Grafical_Overview",on_page_load= True)]\n\n''')

    fp.write('#/******************************************/\n')
    fp.write('#/*** Create funktions    	***/\n')
    fp.write('#/******************************************/\n\n')
    fp.write('\tdef datahead(self,params):\n')
    fp.write(f'\t\tdf = of.Data({name}.link)\n')
    fp.write('\t\treturn df.head(10)\n\n')

    fp.write('\tdef description(self, params):\n')
    fp.write('\t\tvalue = params["values"]\n')
    fp.write(f'\t\tdf = of.overview({name}.link,True)\n')
    fp.write('\t\tdf=pd.DataFrame(df.transpose()[value])\n')
    fp.write('\t\treturn df\n\n')


    fp.write('\tdef description_plot(self, params):\n')
    fp.write('\t\tvalue = params["values"]\n')
    fp.write(f'\t\tdf = of.overview({name}.link,True)\n')
    fp.write('\t\tdata=pd.DataFrame(df.loc[value]["null":"not_null"])\n')

    fp.write('\t\tif data.iloc[0,:][0]==0:\n')
    fp.write('\t\t\tdata.loc["null"]=1 \n')
    fp.write('\t\telif data.iloc[1,:][0]==0: \n')
    fp.write('\t\t\tdata.loc["not_null"]=1\n')

    fp.write('\t\tstudentDict = dict(zip(data.index.astype(str), data[value]))\n')
    fp.write('\t\tdata_fix = pd.Series(studentDict).reset_index(name="value").rename(columns={"index": "country"})\n')
    fp.write('\t\tdata_fix["angle"] = data_fix["value"]/data_fix["value"].sum() * 2*pi\n')
    fp.write('\t\tdata_fix["color"] = ["#595959","#85BC22"]\n')

    fp.write('\t\tif data_fix["value"][0]==1:\n')
    fp.write('\t\t\tdata_fix["perc"]=[0,100]\n')
    fp.write('\t\telif data_fix["value"][1]==1:\n')
    fp.write('\t\t\tdata_fix["perc"]=[100,0]\n')
    fp.write('\t\telse:\n')
    fp.write('\t\t\tdata_fix["perc"]=round(data_fix["value"]/data_fix["value"].sum()*100,3)\n')

    fp.write('\t\tp = figure(sizing_mode="stretch_both",max_width=800,max_height=800, toolbar_location=None,tools="hover", tooltips=[("name", "@country"),("Value", "@value"), ("Percent", "@perc")], x_range=(-0.5, 1.0), title="Null Values vs Not Null Values")\n')
    fp.write('\t\tp.title.align = "center"\n')
    fp.write('\t\tp.title.text_font_size = "15px"\n')
    fp.write('''\t\tp.wedge(x=0, y=1, radius=0.4,
        start_angle=cumsum("angle", include_zero=True), end_angle=cumsum("angle"),
        line_color="white", fill_color="color", legend_field="country", source=data_fix)\n''')

    fp.write('\t\tp.axis.axis_label = None\n')
    fp.write('\t\tp.axis.visible = False\n')
    fp.write('\t\tp.grid.grid_line_color = None\n')
    fp.write('\t\thtml = file_html(p, CDN, "my plot")\n')
    fp.write('\t\thtml = "<center>"+html+"</center>"\n')
    fp.write(f'\t\tif platform =="darwin":  \n')
    fp.write(f'\t\t\tsave(p,"picture/description_plot_{name}.html")\n')
    fp.write(f'\t\telif platform =="win32":  \n')
    fp.write(f'\t\t\tsave(p,"picture\\description_plot_{name}.html")\n')
    fp.write('\t\treturn html\n\n')



    fp.write('\tdef unique(self, params):\n')
    fp.write('\t\tvalue = params["values"]\n')
    fp.write('\t\ttest=copy.copy(value)\n')
    fp.write(f'\t\tdf_string = of.data_str({name}.link)\n')
    fp.write('\t\tdf=pd.DataFrame(df_string[value].value_counts()).reset_index(drop=False)\n')
    fp.write('\t\tnew_row = {"index":"NULL", value:df_string[value].isna().sum(),"col":"#595959"}\n')
    fp.write('\t\tdf["col"]=["#85BC22" for x in range(len(df.index))]\n')
    fp.write('\t\tdf = df.append(new_row, ignore_index=True)\n')

    fp.write('\t\tif df.empty:\n')
    fp.write('''\t\t\thtml=f"The column <b>{test}</b> is completly NULL and has no Unique Values"\n''')
    fp.write('''\t\t\thtml = "<center><p style='font-size: 22px'>"+html+"</p></center>"\n''')
    fp.write('\t\t\treturn html\n')


    fp.write('\t\tlangs = df["index"].to_list()\n')
    fp.write('\t\tdata = dict(langs = langs,unique   = [ int(x) for x in df[value].to_list()],col=df["col"].tolist() )\n')
    fp.write('\t\tsource = ColumnDataSource(data=data)\n')

    fp.write('\t\tp = plotting.figure(x_range = langs, sizing_mode="stretch_both",toolbar_location=None, tools="", title="Unique values in Column")\n')
    fp.write('\t\tp.title.align = "center"\n')
    fp.write('\t\tp.title.text_font_size = "15px"\n')
    fp.write('\t\tp.xaxis.major_label_orientation = "vertical"\n')
    fp.write('\t\tp.vbar(x = dodge("langs",  0, range=p.x_range), top="unique", width = 0.5,name="unique",source=source,fill_color ="col",line_color="white")\n')
    fp.write('\t\thover = HoverTool()\n')

    fp.write('\t\thover.tooltips = """<div><div><strong>Element:  </strong>@langs</div><div><strong>Count: </strong>@$name</div></div>"""\n')
    fp.write('\t\tp.add_tools(hover)\n')
    fp.write('\t\thtml = file_html(p, CDN, "plot")\n')
    fp.write('\t\thtml = "<center>"+html+"</center>"\n')
    fp.write(f'\t\tif platform =="darwin":  \n')
    fp.write(f'\t\t\tsave(p,"picture/unique{name}.html")\n')
    fp.write(f'\t\telif platform =="win32":  \n')
    fp.write(f'\t\t\tsave(p,"picture\\\\unique{name}.html")\n')
    fp.write('\t\treturn html\n')

    fp.write('if __name__ == "__main__":\n')
    fp.write(f'\tapp = {name}()\n')
    fp.write('\tapp.launch(port=64015)\n')



   
    fp.close()


    print ("\n")

if __name__=='__main__':
    # execute mutliple files
    if files:
        for file in f.get_file_name(filename=file_extension):
            print(file)
            app_generator(author,path,file,app_folder)
    #execute a single file
    else:
        app_generator(author,path,file,app_folder)