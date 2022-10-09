#!/user/bin/env python

from spyre.server import Site, App
import os

def app_files(filename='.py'):
    name_list = []
    cwd = os.getcwd()
    cwd=f'{cwd}\\apps'
    for root, dirs, files in os.walk(cwd):
        for file in files:
            if file.endswith(filename):
                name_list.append(file)
    return name_list

import apps
#from stocks_example import StockExample
#from image_editor import ImageEditor


class Index(App):
    def getHTML(self, params):
        return "Title Page Here"


site = Site(Allgemein_overview)
for app in app_files():

    from stocks_example import StockExample
#site.addApp(StockExample, '/app2')
#site.addApp(ImageEditor, '/app2/app3')


site.launch(port=8082)
