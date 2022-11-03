import pandas as pd
import os
from sys import platform

def XLSX_to_csv(filename):
    read_file = pd.read_excel(filename, dtype=str)
    read_file.to_csv(f'{filename[:-5]}.csv', index=None, header=True, sep='|')
    return filename.replace('XLSX', 'csv')


def show_info_for_column(df, column):
    return pd.DataFrame(df[column].describe()).reset_index(drop=False)


def get_file_name(filename='.txt'):
    name_list = []
    cwd = os.getcwd()
    for root, dirs, files in os.walk(cwd):
        for file in files:
            if file.endswith(filename):
                name_list.append(file)
    return name_list


def filepath(filename, foldername):
    if __name__ == '__main__':
        # print(os.path.dirname(__file__))
        d = os.path.normpath(os.path.abspath('') + os.sep + os.pardir)
        #print('Ja: ',d)
    else:
        # print(0)
        d = os.getcwd()
        #print('Nein: ',d)
    outdir = d+f'/{foldername}'
    # print(outdir)
    if not os.path.exists(outdir):
        os.mkdir(outdir)
    return f'{outdir}/{filename}'


def get_files_in_folder(extension, folder):
    files_in_process = []
    for file in get_file_name(filename=extension):
        # print(file.split('.')[0])
        pathnew = filepath(fr'{file}', folder)
        files_in_process.append(
            {"label": file.split('.')[0], "value": pathnew})
    return files_in_process


def Data(value):
        df=pd.read_csv(value,sep='|',low_memory=False)
        return df
def columns_in_data(df):
    df.columns

def erstellen_columns(df):
    columns_in_file=[]
    for file in df.columns:
            #print(file.split('.')[0])
            columns_in_file.append({"label":file , "value": file})

def convert_int(convert,df):
    pbjekts=pd.DataFrame(df.dtypes,columns=['types'])
    for x in pbjekts[pbjekts['types']=='object'].index.to_list():
        try:
            df[x]=df[x].astype(convert)
        except:
            pass

def date_check(df,var):
    col=[s for s in df.columns.to_list() if any([x.lower for x in var if x.lower() in s.lower()])]
    for x in col:
        if df[x].str.len().mean()==4:
            #print('ja')
            col.remove(x)
    return col

def data_aufbereitet(value):
    df=pd.read_csv(value,sep='|',dtype=str,low_memory=False)
    var=['jahr','datum','Dat']
    col=date_check(df,var)
    df[col]=df.loc[:,col].apply(pd.to_datetime)
    var2=['zeit','uhr']
    col2=date_check(df,var2)
    df[col2]=df.loc[:,col2].apply(pd.to_datetime)
    for x in col2:
        df[x]=df[x].dt.time
    pbjekts=pd.DataFrame(df.dtypes,columns=['types'])
    list=pbjekts[pbjekts['types']=='object'].index.to_list()
    zeiten=['jahr','datum','Dat','zeit','uhr']
    new_list= [s for s in list if not any([x.lower for x in zeiten if x in s.lower()])]
    new_list = [s for s in list if not df[s].isnull().values.all()]
    new_list= [s for s in list if not (df[s] == '0.0').all()] 
    new_list= [s for s in list if not (df[s] == 0.0).all()] 
    new_list= [s for s in list if not (df[s] == 0).all()] 
    new_list= [s for s in list if not (df[s] == 'nan').all()] 
    for column in new_list:
        try:
            if any(round(df[column].astype(float)) != df[column].astype(float)):
                #print('float: ',column)
                df[column]=df[column].astype(float)
            elif all(round(df[column].astype(float)) == df[column].astype(float)):
                #print('int: ',column)
                df[column]=df[column].astype(int).round()
        except:
            continue
    return df


def data_str(value):
    df_string= pd.read_csv(value,sep='|',dtype=str,low_memory=False)
    return df_string
 

def overview(value,nummer=False):
    df=data_aufbereitet(value)
    pbjekts=pd.DataFrame(df.dtypes,columns=['types'])
    pbjekts['unique']=df.nunique()
    pbjekts['null']=df.isna().sum()
    pbjekts['not_null']=df.count()
    if nummer:
        return pd.merge(pbjekts, df.describe().transpose(),how='left', left_index=True, right_index=True)
    return pbjekts


def columns(params):
    column_in_process=[]
    columns_in_table = Data(params).columns
    for col in columns_in_table:
    # print(file.split('.')[0])
        column_in_process.append(
            {"label": col, "value": col})
    return column_in_process

def app_files(filename='.py'):
    name_list = []
    cwd = os.getcwd()
    cwd=f'{cwd}\\apps'
    for root, dirs, files in os.walk(cwd):
        for file in files:
            if file.endswith(filename):
                name_list.append(file)
    return name_list


def platforming():
    if platform == "darwin":
        return '/'
    elif platform == "win32":
        return '\\'