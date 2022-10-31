#/*******************************************
#***
#***
#*** Author:	Niclas Cramer
#*** Date:	  29 Oct 2022 14:12:52
#***
#*** Source:	processed\SAP_Test_Data_GLT0_Table_for_automation copy.txt_processed
#***
#*** Topic:	Automatically generated app script.
#***
#***
#*******************************************/

#/******************************************/
#/***              Imports		    	    ***/
#/******************************************/

from spyre import server
import pandas as pd
from math import pi
import modules.overall_funktions as of
from sys import platform
#/******************************************/
#/***            Bokeh imports    	***/
#/******************************************/

from bokeh import plotting
from bokeh.transform import cumsum, dodge
from bokeh.plotting import figure,save
from bokeh.resources import CDN
from bokeh.embed import file_html
from bokeh.models import ColumnDataSource,HoverTool
import copy

#/******************************************/
#/*** Create the app    	***/
#/******************************************/

server.include_df_index = True
class SAP_Test_Data_GLT0_Table_for_automation_copy(server.App): 
	if platform == 'darwin':
		link = "processed/SAP_Test_Data_GLT0_Table_for_automation copy.txt_processed"
	elif platform == 'win32':
		link = "processed\\SAP_Test_Data_GLT0_Table_for_automation copy.txt_processed"
	title = "Overview of the Table SAP_Test_Data_GLT0_Table_for_automation_copy"
	inputs = [dict(type= 'dropdown',label= 'Inputs',options= of.columns(link),value= 'BSEG',key= 'values',action_id= 'update_data')]

	controls = [dict(type= "button",id= "update_data",label= "reload the data")]
	tabs = ["Table","Overview_of_the_Table","Grafical_Overview"]
	outputs = [dict(type= "table",id= "datahead",control_id= "update_data",tab= "Table",sortable=True,on_page_load= True),
        dict(type= "table",id= "description",control_id= "update_data",tab= "Overview_of_the_Table",sortable=True,on_page_load= True),
        dict(type= "html",id= "description_plot",control_id= "update_data",tab= "Grafical_Overview",sortable=True,on_page_load= True),
        dict(output_type= "html",id= "unique",control_id= "update_data",tab= "Grafical_Overview",on_page_load= True)]

#/******************************************/
#/*** Create funktions    	***/
#/******************************************/

	def datahead(self,params):
		df = of.Data(SAP_Test_Data_GLT0_Table_for_automation_copy.link)
		return df.head(10)

	def description(self, params):
		value = params["values"]
		df = of.overview(SAP_Test_Data_GLT0_Table_for_automation_copy.link,True)
		df=pd.DataFrame(df.transpose()[value])
		return df

	def description_plot(self, params):
		value = params["values"]
		df = of.overview(SAP_Test_Data_GLT0_Table_for_automation_copy.link,True)
		data=pd.DataFrame(df.loc[value]["null":"not_null"])
		if data.iloc[0,:][0]==0:
			data.loc["null"]=1 
		elif data.iloc[1,:][0]==0: 
			data.loc["not_null"]=1
		studentDict = dict(zip(data.index.astype(str), data[value]))
		data_fix = pd.Series(studentDict).reset_index(name="value").rename(columns={"index": "country"})
		data_fix["angle"] = data_fix["value"]/data_fix["value"].sum() * 2*pi
		data_fix["color"] = ["#595959","#85BC22"]
		if data_fix["value"][0]==1:
			data_fix["perc"]=[0,100]
		elif data_fix["value"][1]==1:
			data_fix["perc"]=[100,0]
		else:
			data_fix["perc"]=round(data_fix["value"]/data_fix["value"].sum()*100,3)
		p = figure(sizing_mode="stretch_both",max_width=800,max_height=800, toolbar_location=None,tools="hover", tooltips=[("name", "@country"),("Value", "@value"), ("Percent", "@perc")], x_range=(-0.5, 1.0), title="Null Values vs Not Null Values")
		p.title.align = "center"
		p.title.text_font_size = "15px"
		p.wedge(x=0, y=1, radius=0.4,
        start_angle=cumsum("angle", include_zero=True), end_angle=cumsum("angle"),
        line_color="white", fill_color="color", legend_field="country", source=data_fix)
		p.axis.axis_label = None
		p.axis.visible = False
		p.grid.grid_line_color = None
		html = file_html(p, CDN, "my plot")
		html = "<center>"+html+"</center>"
		if platform == 'darwin':
			save(p,"picture/description_plot_SAP_Test_Data_GLT0_Table_for_automation_copy.html")
		elif platform == 'win32':
			save(p,"picture\\description_plot_SAP_Test_Data_GLT0_Table_for_automation_copy.html")
		return html

	def unique(self, params):
		value = params["values"]
		test=copy.copy(value)
		df_string = of.data_str(SAP_Test_Data_GLT0_Table_for_automation_copy.link)
		df=pd.DataFrame(df_string[value].value_counts()).reset_index(drop=False)
		new_row = {"index":"NULL", value:df_string[value].isna().sum(),"col":"#595959"}
		df["col"]=["#85BC22" for x in range(len(df.index))]
		df = df.append(new_row, ignore_index=True)
		if df.empty:
			html=f"The column <b>{test}</b> is completly NULL and has no Unique Values"
			html = "<center><p style='font-size: 22px'>"+html+"</p></center>"
			return html
		langs = df["index"].to_list()
		data = dict(langs = langs,unique   = [ int(x) for x in df[value].to_list()],col=df["col"].tolist() )
		source = ColumnDataSource(data=data)
		p = plotting.figure(x_range = langs, sizing_mode="stretch_both",toolbar_location=None, tools="", title="Unique values in Column")
		p.title.align = "center"
		p.title.text_font_size = "15px"
		p.xaxis.major_label_orientation = "vertical"
		p.vbar(x = dodge("langs",  0, range=p.x_range), top="unique", width = 0.5,name="unique",source=source,fill_color ="col",line_color="white")
		hover = HoverTool()
		hover.tooltips = """<div><div><strong>Element:  </strong>@langs</div><div><strong>Count: </strong>@$name</div></div>"""
		p.add_tools(hover)
		html = file_html(p, CDN, "plot")
		html = "<center>"+html+"</center>"
		if platform == 'darwin':
			save(p,"picture/uniqueSAP_Test_Data_GLT0_Table_for_automation_copy.html")
		elif platform == 'win32':
			save(p,"picture\\uniqueSAP_Test_Data_GLT0_Table_for_automation_copy.html")
		return html
if __name__ == "__main__":
	app = SAP_Test_Data_GLT0_Table_for_automation_copy()
	app.launch(port=64015)
