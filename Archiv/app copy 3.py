from spyre import server
import yfinance as yf
import pandas as pd
from math import pi
import modules.overall_funktions as of
import pandas as pd
from bokeh.transform import cumsum

#from bokeh import plotting

from bokeh.resources import CDN
from bokeh.embed import file_html
from bokeh import plotting
from bokeh.models.sources import ColumnDataSource


server.include_df_index = True


class StockExample(server.App):
    title = "Historical Stock Prices"

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
        "label": "get historical stock prices"
    }]

    tabs = ["Plot", "Table", 'Bokeh']

    outputs = [

        {
            "type": "table",
            "id": "table_id",
            "control_id": "update_data",
            "tab": "Table",
            "on_page_load": True
        },
        {
            "output_type": "html",
            "output_id": "bokeh_plot",
            "control_id": "update_data",
            "tab": "Bokeh",
            "on_page_load": True
        },
        {
            "output_type": "html",
            "output_id": "test",
            "control_id": "update_data",
            "tab": "Bokeh",
            "on_page_load": True
        }
    ]

    def getData(self, params):

        value = params['values']
        df = of.Data(value)
        return df.head(10)

    def getHTML(self, params):
        value = params['values']
        df = of.Data(value)

        data = pd.DataFrame({
            'NULL': [df.isna().sum().sum()], 'Not_NULL': [df.count().sum()]
        })

        if data.iloc[0, :][0] == 0:
            data.loc['null'] = 1
        data = data.transpose()
        d = {'Column anzahl': [len(df.columns.to_list())]}
        overview = pd.DataFrame(data=d)
        overview[data.index.astype(str)] = data[0]
        overview['Anzahl der Rows'] = len(df.index)
        studentDict = dict(zip(data.index.astype(str), data[0]))
        data_fix = pd.Series(studentDict).reset_index(
            name='value').rename(columns={'index': 'country'})
        data_fix['angle'] = data_fix['value']/data_fix['value'].sum() * 2*pi
        data_fix['color'] = ['#35B778', '#a1dab4']
        data_fix['perc'] = round(
            data_fix['value']/data_fix['value'].sum()*100, 3)
        print(data_fix)
        p = plotting.figure(plot_width=500, plot_height=400, title="Total Null vs NotNull Values over complete File", toolbar_location=None,
                            tools="hover", tooltips=[('name', "@country"), ("Value", "@value"), ("Percent", "@perc")], x_range=(-0.5, 1.0))

        p.wedge(x=0, y=1, radius=0.4,
                start_angle=cumsum('angle', include_zero=True), end_angle=cumsum('angle'),
                line_color="white", fill_color='color', legend_field='country', source=data_fix)

        p.axis.axis_label = None
        p.axis.visible = False
        p.grid.grid_line_color = None
        source = ColumnDataSource(data_fix)

        print(source.data)
        html = file_html(p, CDN, "my plot")

        html = '<center>'+html+'</center>'
        return html

    def test(self, params):
        value = params['values']
        df = of.Data(value)

        data = pd.DataFrame({
            'NULL': [df.isna().sum().sum()], 'Not_NULL': [df.count().sum()]
        })

        if data.iloc[0, :][0] == 0:
            data.loc['null'] = 1
        data = data.transpose()
        d = {'Column anzahl': [len(df.columns.to_list())]}
        overview = pd.DataFrame(data=d)
        overview[data.index.astype(str)] = data[0]
        overview['Anzahl der Rows'] = len(df.index)
        studentDict = dict(zip(data.index.astype(str), data[0]))
        data_fix = pd.Series(studentDict).reset_index(
            name='value').rename(columns={'index': 'country'})
        data_fix['angle'] = data_fix['value']/data_fix['value'].sum() * 2*pi
        data_fix['color'] = ['#35B778', '#a1dab4']
        data_fix['perc'] = round(
            data_fix['value']/data_fix['value'].sum()*100, 3)
        print(data_fix)
        p = plotting.figure(plot_width=500, plot_height=400, title="Total Null vs NotNull Values over complete File", toolbar_location=None,
                            tools="hover", tooltips=[('name', "@country"), ("Value", "@value"), ("Percent", "@perc")], x_range=(-0.5, 1.0))

        p.wedge(x=0, y=1, radius=0.4,
                start_angle=cumsum('angle', include_zero=True), end_angle=cumsum('angle'),
                line_color="white", fill_color='color', legend_field='country', source=data_fix)

        p.axis.axis_label = None
        p.axis.visible = False
        p.grid.grid_line_color = None
        source = ColumnDataSource(data_fix)

        print(source.data)
        html = file_html(p, CDN, "my plot")

        html = '<center>'+html+'</center>'
        return html


if __name__ == '__main__':
    app = StockExample()
    app.launch(port=8010)
