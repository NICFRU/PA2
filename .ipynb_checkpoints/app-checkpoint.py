from spyre import server
import yfinance as yf
import pandas as pd

server.include_df_index = True


class StockExample(server.App):
    title = "Historical Stock Prices"

    inputs = [{
        "type": 'dropdown',
        "label": 'Inputs',
        "options": [
            {"label": "BSEG", "value": "processed\SAP_Test_Data_BSEG Table.txt_processed"},
            {"label": "GLT0", "value": "processed\SAP_Test_Data_GLT0 Table.txt_processed"},
            {"label": "BKPF", "value": "processed\SAP_Test_Data_BKPF Table.txt_processed"}],
        "value": 'BSEG',
        "key": 'values',
        "action_id": "update_data"
    }]

    controls = [{
        "type": "button",
        "id": "update_data",
        "label": "get historical stock prices"
    }]

    tabs = ["Plot", "Table"]

    outputs = [
        # {
        #     "type": "plot",
        #     "id": "plot",
        #     "control_id": "update_data",
        #     "tab": "Plot"},
        {
            "type": "table",
            "id": "table_id",
            "control_id": "update_data",
            "tab": "Table",
            "on_page_load": True
        }
    ]

    def getData(self, params):
        value=params['values']
        df=pd.read_csv(value,sep='|',low_memory=False)
        return df.head(10)

    # def getPlot(self, params):
    #     df = self.getData(params)
    #     plt_obj = df.plot()
    #     plt_obj.set_ylabel("Price")
    #     plt_obj.set_xlabel("Date")
    #     plt_obj.set_title(params['ticker'])
    #     return plt_obj.get_figure()


app = StockExample()
app.launch(port=8081)