from spyre import server
import yfinance as yf
import pandas as pd
from math import pi
import modules.overall_funktions as of
import pandas as pd

from bokeh.io import output_file, show
from bokeh.palettes import BuGn,PRGn
from bokeh.plotting import figure
from bokeh.transform import cumsum
from bokeh.plotting import figure, output_notebook, show

from bokeh.resources import INLINE
from bokeh.resources import CDN
from bokeh.models import CustomJS, MultiSelect
from bokeh.embed import components
#from bokeh import plotting
#from bokeh.io import vform
server.include_df_index = True


class StockExample(server.App):
    title = "Historical Stock Prices"
  
    inputs = [{
        "type": 'dropdown',
        "label": 'Inputs',
        "options": of.get_files_in_folder('.txt_processed','processed'),
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
        "label": "get historical stock prices"
    }]

    tabs = ["Plot", "Table"]

    outputs = [
        {
            "type": "plot",
            "id": "plot",
            "control_id": "update_data",
            "tab": "Plot"},
        {
            "type": "table",
            "id": "table_id",
            "control_id": "update_data",
            "tab": "Table",
            "on_page_load": True
        }
    ]



    def getData(self, params):
        #print(f'Hier!!!!! {self}, {params}')
        value=params['values']
        df=of.Data(value)
        return df.head(10)

    def getHTML(self, params):
        value=params['values']
        df=of.Data(value)
        
        data=pd.DataFrame({
            'NULL': [df.isna().sum().sum()]
            ,'Not_NULL': [df.count().sum()]
        })
        #z=data.set_index('type').to_dict()['number']
        if data.iloc[0,:][0]==0:
            data.loc['null']=1
        data=data.transpose()
        d={'Column anzahl':[len(df.columns.to_list())]}
        overview=pd.DataFrame(data=d)
        overview[data.index.astype(str)]= data[0]
        overview['Anzahl der Rows']=len(df.index)
        studentDict = dict(zip(data.index.astype(str), data[0]))
        data_fix = pd.Series(studentDict).reset_index(name='value').rename(columns={'index': 'country'})
        data_fix['angle'] = data_fix['value']/data_fix['value'].sum() * 2*pi
        data_fix['color'] = ['#35B778','#a1dab4']
        data_fix['perc']=round(data_fix['value']/data_fix['value'].sum()*100,3)
        p = figure(height=350, title="Total Null vs NotNull Values over complete File", toolbar_location=None, 
           tools="hover", tooltips=
           [('name', "@country"),("Value", "@value"), ("Percent", "@perc")]
           , x_range=(-0.5, 1.0))

        p.wedge(x=0, y=1, radius=0.4,
                start_angle=cumsum('angle', include_zero=True), end_angle=cumsum('angle'),
                line_color="white", fill_color='color', legend_field='country', source=data_fix)

        p.axis.axis_label = None
        p.axis.visible = False
        p.grid.grid_line_color = None

  
        script,div=components(p,CDN)
        html = "%s\n%s"%(div, script)


        html='<center>'+html+'</center>'
        return html
        
    # def getCustomJS(self):
    #     INLINE.js_raw[0]+INLINE.js_raw[1]

    # def getCustomCSS(self):
    #     css=INLINE.css_raw[0]+INLINE.css_raw[1]
    #     return css
if __name__ == '__main__':
    app = StockExample()
    app.launch(port=8082)