
from spyre import server
import pandas as pd
from math import pi
import modules.overall_funktions as of
import pandas as pd
import os
from sys import platform

#from bokeh import plotting
from bokeh import plotting
from bokeh.transform import cumsum, dodge
from bokeh.palettes import BuGn,PRGn
from bokeh.plotting import figure,save
from bokeh.resources import CDN
from bokeh.embed import file_html
#from bokeh.models.sources import ColumnDataSource
from bokeh.models import ColumnDataSource,HoverTool




server.include_df_index = True


class overview(server.App):
    title = "Overview of the Table"

    inputs = [{
        "type": 'dropdown',
        "label": 'Inputs',
        "options": of.get_files_in_folder('.txt_processed', 'processed'),
        "value": 'BSEG',
        "key": 'values',
        "action_id": "update_data"
    }
        # ,
        # {"type": 'dropdown',
        #     "label": 'Inputs',
        #     "options": of.erstellen_columns(of.Data('processed\SAP_Test_Data_BKPF Table.txt_processed')),
        #     "value": 'Buchungskreis',
        #     "key": 'values',
        #     "action_id": "update_data"}

    ]

    controls = [{
        "type": "button",
        "id": "update_data",
        "label": "reload the data"
    }]

    tabs = ["Table",'Overview_of_the_Table', 'unique','Overview']

    outputs = [

        {
            "type": "table",
            "id": "datahead",
            "control_id": "update_data",
            "tab": "Table",
            "sortable":True,
            "on_page_load": True
        },
        {
            "type": "table",
            "id": "description",
            "control_id": "update_data",
            "tab": "Overview_of_the_Table",
            "sortable":True,
            "on_page_load": True
        },
        {
            "output_type": "html",
            "id": "nullvalues",
            "control_id": "update_data",
            "tab": 'Overview',
            "on_page_load": True
        },
        {
            "output_type": "html",
            "id": "qol",
            "control_id": "update_data",
            "tab": 'Overview',
            "on_page_load": True
        }
        ,
        {
            "output_type": "html",
            "id": "unique_big",
            "control_id": "update_data",
            "tab": 'unique',
            "on_page_load": True
        }
        ,
        {
            "output_type": "html",
            "id": "unique_small",
            "control_id": "update_data",
            "tab": 'unique',
            "on_page_load": True
        }
        ,
        {
            "output_type": "html",
            "id": "column_null",
            "control_id": "update_data",
            "tab": 'Overview',
            "on_page_load": True
        }
    ]

    def datahead(self, params):

        value = params['values']
        df = of.Data(value)
        return df.head(10)

    def description(self, params):
        value = params['values']
        df = of.overview(value,True)
        return df 


    
    def nullvalues(self, params):
        value = params['values']
        print(value)
        label_2 = value.split('/')[-1].split('.')[0]
        
        df = of.Data(value)

        data = pd.DataFrame({
            'NULL': [df.isna().sum().sum()], 'Not_NULL': [df.count().sum()]
        })

        if data.iloc[0, :][0] == 0:
            data.loc['NULL'] = 1
       
        data = data.transpose()
        d = {'Column anzahl': [len(df.columns.to_list())]}
        overview = pd.DataFrame(data=d)
        overview[data.index.astype(str)] = data[0]
        overview['Anzahl der Rows'] = len(df.index)
        studentDict = dict(zip(data.index.astype(str), data[0]))
        data_fix = pd.Series(studentDict).reset_index(
            name='value').rename(columns={'index': 'country'})
        data_fix['angle'] = data_fix['value']/data_fix['value'].sum() * 2*pi
        data_fix['color'] = ["#595959","#85BC22"]
        if data_fix['value'][0]==1:
            data_fix['perc']=[0,100]
        elif data_fix['value'][1]==1:
            data_fix['perc']=[100,0]
        else:
            data_fix['perc']=round(data_fix['value']/data_fix['value'].sum()*100,3)
        
        p = plotting.figure(sizing_mode='stretch_both',max_width=1000,max_height=1000, title="Total Null vs NotNull Values over complete File", toolbar_location=None,
                            tools="hover", tooltips=[('name', "@country"), ("Value", "@value"), ("Percent", "@perc")], x_range=(-0.5, 1.0))
        p.title.align = "center"
        p.title.text_font_size = "15px"
        p.wedge(x=0, y=1, radius=0.4,
                start_angle=cumsum('angle', include_zero=True), end_angle=cumsum('angle'),
                line_color="white", fill_color='color', legend_field='country', source=data_fix)

        p.axis.axis_label = None
        p.axis.visible = False
        p.grid.grid_line_color = None
        source = ColumnDataSource(data_fix)

        #print(source.data)
        html = file_html(p, CDN, "my plot")
        pathnew = os.getcwd()
        #pathnew=pathnew.replace("\\",'\\\\')
        html = '<center>'+html+'</center>'
        if platform == 'darwin':
            save(p,f'picture/nullvalues_{label_2}.html')
        elif platform == 'win32':
            save(p,f'picture\\nullvalues_{label_2}.html')
        return html

    def qol(self, params):
        value = params['values']
        label_2 = value.split('/')[-1].split('.')[0]
        pbjekts=of.overview(value)
        types_df=pd.DataFrame(pbjekts['types'].value_counts()).reset_index(drop=False)
        types_df['types']
        data= types_df.copy()
        data=data.rename(columns={'index':'type','types':'number'})
        #z=data.set_index('type').to_dict()['number']
        studentDict = dict(zip(data.type.astype(str), data.number))
        data_fix = pd.Series(studentDict).reset_index(name='value').rename(columns={'index': 'country'})
        data_fix['angle'] = data_fix['value']/data_fix['value'].sum() * 2*pi
        data_fix['color'] = BuGn[len(studentDict)]
        if data_fix['value'][0]==1:
            data_fix['perc']=[0,100]
        elif data_fix['value'][1]==1:
            data_fix['perc']=[100,0]
        else:
            data_fix['perc']=round(data_fix['value']/data_fix['value'].sum()*100,3)
        
        p = plotting.figure(sizing_mode='stretch_both', title="Possible Types in the File",max_width=1000,max_height=1000,  toolbar_location=None,
           tools="hover", tooltips=[('name', "@country"),("Columns", "@value"), ("Percent", "@perc")], x_range=(-0.5, 1.0))
        p.title.align = "center"
        p.title.text_font_size = "15px"
        p.wedge(x=0, y=1, radius=0.4,
                start_angle=cumsum('angle', include_zero=True), end_angle=cumsum('angle'),
                line_color="white", fill_color='color', legend_field='country', source=data_fix)

        p.axis.axis_label = None
        p.axis.visible = False
        p.grid.grid_line_color = None

        html = file_html(p, CDN, "plot")
        pathnew = os.getcwd()
        #pathnew=pathnew.replace("\\",'\\\\')
        html = '<center>'+html+'</center>'
        if platform == 'darwin':
            save(p,f'picture/type_{label_2}.html')
        elif platform == 'win32':
            save(p,f'picture\\type_{label_2}.html')
        html = '<center>'+html+'</center>'
        return html

    def unique_big(self, params):
        value = params['values']
        label_2 = value.split('/')[-1].split('.')[0]
        pbjekts=of.overview(value)
        
        #pr=pbjekts[pbjekts['unique']<200]
        pg=pbjekts[pbjekts['unique']>=200]
        if pg.empty:
            pass
        langs = pg.index.to_list()
        data = {'langs' : langs,
                'unique'   : [ int(x) for x in pg['unique'].to_list() ]
                }
        source = ColumnDataSource(data=data)
        
        p = plotting.figure(x_range = langs, sizing_mode='stretch_both',toolbar_location=None, tools="", title="Unique values with equal or less than 200  unique values")
        p.title.align = "center"
        p.title.text_font_size = "15px"
        p.xaxis.major_label_orientation = "vertical"
        p.vbar(x = dodge('langs',  0, range=p.x_range), top='unique', width = 0.5,name='unique',source=source,color ='#85BC22')
        hover = HoverTool()
        hover.tooltips = """
        <div>
            <div><strong>Column:  </strong>@langs</div>
            <div><strong>Count: </strong>@$name</div>
        </div>"""
        p.add_tools(hover)

        html = file_html(p, CDN, "plot")
        pathnew = os.getcwd()
        #pathnew=pathnew.replace("\\",'\\\\')
        html = '<center>'+html+'</center>'
        if platform == 'darwin':
            save(p,f'picture/unique_big_{label_2}.html')
        elif platform == 'win32':
            save(p,f'picture\\unique_big_{label_2}.html')
        html = '<center>'+html+'</center>'
        return html

    def unique_small(self, params):
        value = params['values']
        label_2 = value.split('/')[-1].split('.')[0]
        pbjekts=of.overview(value)
        
        pr=pbjekts[pbjekts['unique']<200]
        #pg=pbjekts[pbjekts['unique']>=200]
        if pr.empty:
            pass
        langs = pr.index.to_list()
        data = {'langs' : langs,
                'unique'   : [ int(x) for x in pr['unique'].to_list() ]
                }
        source = ColumnDataSource(data=data)
        
        p = plotting.figure(x_range = langs, sizing_mode='stretch_both',toolbar_location=None, tools="", title="Unique values with qual or more than 200  unique values")
        p.title.align = "center"
        p.title.text_font_size = "15px"
        p.xaxis.major_label_orientation = "vertical"
        p.vbar(x = dodge('langs',  0, range=p.x_range), top='unique', width = 0.5,name='unique',source=source,color ='#85BC22')
        hover = HoverTool()
        hover.tooltips = """
        <div>
            <div><strong>Column:  </strong>@langs</div>
            <div><strong>Count: </strong>@$name</div>
        </div>"""
        p.add_tools(hover)

        html = file_html(p, CDN, "plot")
        pathnew = os.getcwd()
        #pathnew=pathnew.replace("\\",'\\\\')
        html = '<center>'+html+'</center>'
        if platform == 'darwin':
            save(p,f'picture/unique_small_{label_2}.html')
        elif platform == 'win32':
            save(p,f'picture\\unique_small_{label_2}.html')
        html = '<center>'+html+'</center>'
        return html


    def column_null(self, params):
        value = params['values']
        label_2 = value.split('/')[-1].split('.')[0]
        pbjekts=of.overview(value)
        
        NullNotNull = pbjekts.index.to_list()
        #pg=pbjekts[pbjekts['unique']>=200]
        data = {'NullNotNull' : NullNotNull,
        'null'   : [ int(x) for x in pbjekts['null'].to_list() ],
        'notnull'   : [ int(x) for x in pbjekts['not_null'].to_list() ]}
        source = ColumnDataSource(data=data)
        
        p = plotting.figure(x_range = NullNotNull, sizing_mode='stretch_both',toolbar_location=None, tools="", title="Null vs NotNull")
        p.title.align = "center"
        p.title.text_font_size = "15px"
        p.xaxis.major_label_orientation = "vertical"
        p.vbar(x=dodge('NullNotNull',  -0.15,  range=p.x_range), top='null', width=0.2, source=source,
        color="#595959", legend_label="null",name='null')
        p.vbar(x=dodge('NullNotNull',  0.15, range=p.x_range), top='notnull', width=0.2, source=source,
        color="#85BC22", legend_label="notnull",name='notnull')
        hover = HoverTool()
        hover.tooltips = """
        <div>
            <div><strong>Column:  </strong>@NullNotNull</div>
            <div><strong>Count: </strong>@$name</div>
        </div>"""
        p.add_tools(hover)

        html = file_html(p, CDN, "plot")
        pathnew = os.getcwd()
        #pathnew=pathnew.replace("\\",'\\\\')
        html = '<center>'+html+'</center>'
        if platform == 'darwin':
            save(p,f'picture/column_null_{label_2}.html')
        elif platform == 'win32':
            save(p,f'picture\\column_null_{label_2}.html')
        html = '<center>'+html+'</center>'
        return html
if __name__ == '__main__':
    app = overview()
    app.launch(port=8070)
