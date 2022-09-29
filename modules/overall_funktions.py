import pandas as pd

def XLSX_to_csv(filename):
    read_file = pd.read_excel (filename,dtype=str)
    read_file.to_csv (f'{filename[:-5]}.csv', index = None, header=True,sep='|')
    return filename.replace('XLSX', 'csv')