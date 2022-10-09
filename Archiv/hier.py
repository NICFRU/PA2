from spyre import server

import numpy as np
import pandas as pd
from bokeh.plotting import figure

from bokeh.resources import INLINE, CDN
from bokeh.embed import components
from bokeh.models.sources import ColumnDataSource
from bokeh.models import CustomJS, MultiSelect
import bokeh.models as bkm
from bokeh import palettes
from bokeh.layouts  import widgetbox,column

class SimpleApp(server.App):
    title = "Bokeh Test"
    inputs = [{ "type":"text",
                "key":"factor",
                "value":5,
                "label":"factor",
                "action_id":"line_plot"}]
    tabs=["Plot","Data"]
    outputs = [{"type":"html",
                "id":"bokeh_plot",
                "tab":"Plot",
                "control_id":"line_plot"},
                {"type":"table",
                "id":"bokeh_data",
                "tab":"Data",
                "control_id":"line_plot"}]
    controls = [{"type":"HIDDEN",
                 "id":"line_plot"}]
    def getHTML(self, params):
        df=self.getData(params)


        _tools_to_show = 'box_zoom,pan,save,resize,reset,tap,wheel_zoom'
        p=figure(plot_width=600, plot_height=600,x_axis_type='datetime',tools=_tools_to_show)

        colors=palettes.Spectral11
        colori=0

        #create source
        source_dict={}

        source_dict['Date']=df.index.format()
        for col in df.columns.tolist():
            source_dict['xaxis_'+col]=df.index.values
            source_dict['Date_'+col]=df.index.format()

            source_dict['yaxis_'+col]=df[col].values
            source_dict['yname_'+col]=np.tile(col, [len(df.index),1])

            source_dict['yaxisdup_'+col]=df[col].values

        source=ColumnDataSource(source_dict)

        #print source.data

        #source_dict={}
        for col in df.columns:
            #source= ColumnDataSource({'x': df.index.values, 'y': df[col].values, 'series_name': col, 'Date': df.index.format()})
            p.line('xaxis_'+col,'yaxis_'+col,source=source, legend=col,color=colors[colori],line_width=3)
            colori+=1



        colori=0
        scatlist=[]
        for col in df.columns.tolist():

            subdict = {'xaxis_'+col:source.data['xaxis_'+col], 'Date_'+col:source.data['Date_'+col], 'yname_'+col:source.data['yname_'+col],'yaxis_'+col:source.data['yaxis_'+col]}
            tempsource = ColumnDataSource(subdict)
            scat=p.scatter('xaxis_'+col, 'yaxis_'+col, source = source, fill_alpha=0, line_alpha=0.8, line_color=colors[colori],line_width=8)
            colori+=1
            scatlist.append(scat)
            g1_hover = bkm.HoverTool(renderers=[scat], tooltips=[("Series", "@yname_"+col), ("Date", "@Date_"+col),  ("Value", "@yaxis_"+col+"{0.00%}")])    
            g1_hover.mode='mouse'
            p.add_tools(g1_hover)



        p.background_fill_color='black'
        p.background_fill_alpha=0.9


        codestr="""
                var data = source.get('data');
                var f = cb_obj.get('value')

                cols="""+"['"+"','".join([col for col in df.columns.tolist()])+"']"+"""
                for (var i = 0; i < cols.length; i++) {
                    if (f.indexOf(cols[i])> -1) {
                        data['yaxis_'+cols[i]]=data['yaxisdup_'+cols[i]]   
                    }
                    else {
                        data['yaxis_'+cols[i]]='nan'
                    }

                }
                source.trigger('change');
            """
        callback = CustomJS(args=dict(source=source), code=codestr)

        multi_select = MultiSelect(title="Lines to plot:", \
        value=df.columns.tolist(), \
        options=df.columns.tolist(), callback=callback)
        layout = widgetbox(multi_select, p)

        script,div=components(layout,CDN)
        html = "%s\n%s"%(div, script)


        html='<center>'+html+'</center>'
        return html

    def getData(self,params):
        f=int(params['factor'])
        dr=pd.date_range('1-1-2010','12-31-2010',freq='D')
        vals=[i*f for i in range(len(dr))]
        df=pd.DataFrame(vals,index=dr,columns=['data'])

        return df
    # def getCustomJS(self):
    #     return INLINE.js_raw[0]

    # def getCustomCSS(self):
    #     css=INLINE.css_raw[0]
    #     return css
if __name__ == '__main__':
    app = SimpleApp()
    app.launch(port=8084)