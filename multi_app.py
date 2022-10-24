#/*******************************************
#***
#***
#*** Author:	Niclas Cramer
#*** Date:	  23 Oct 2022 13:47:44
#***
#*** Source:	C:\Users\Niclas\Development\PA2\Tool_Niclas_23.06.2022 (1)\multi_app.py
#***
#*** Topic:	Automatically generated app script.
#***
#***
#*******************************************/

#/******************************************/
#/***              Imports		    	    ***/
#/******************************************/

from spyre.server import Site, App
from apps.app_overview import overview
from apps.app_SAP_Test_Data_BKPF_Table import SAP_Test_Data_BKPF_Table
from apps.app_SAP_Test_Data_BKPF_Table_for_Aoutomatisation(1) import SAP_Test_Data_BKPF_Table_for_Aoutomatisation(1)
from apps.app_SAP_Test_Data_BKPF_Table_for_automation import SAP_Test_Data_BKPF_Table_for_automation
from apps.app_SAP_Test_Data_BSEG_Table import SAP_Test_Data_BSEG_Table
from apps.app_SAP_Test_Data_GLT0_Table import SAP_Test_Data_GLT0_Table
from apps.app_SAP_Test_Data_GLT0_Table_for_Atomation(1) import SAP_Test_Data_GLT0_Table_for_Atomation(1)
from apps.app_SAP_Test_Data_GLT0_Table_for_Atomation(1)_copy import SAP_Test_Data_GLT0_Table_for_Atomation(1)_copy
from apps.app_SAP_Test_Data_GLT0_Table_for_automation import SAP_Test_Data_GLT0_Table_for_automation
from apps.app_SAP_Test_Data_GLT0_Table_for_automation_copy import SAP_Test_Data_GLT0_Table_for_automation_copy
#/******************************************/
#/***              App Cration		    ***/
#/******************************************/

class Index(App):
	def getHTML(self, params):
		return "All Apps"

site = Site(overview)
site.addApp(SAP_Test_Data_BKPF_Table, '/app_SAP_Test_Data_BKPF_Table')
site.addApp(SAP_Test_Data_BKPF_Table_for_Aoutomatisation(1), '/app_SAP_Test_Data_BKPF_Table_for_Aoutomatisation(1)')
site.addApp(SAP_Test_Data_BKPF_Table_for_automation, '/app_SAP_Test_Data_BKPF_Table_for_automation')
site.addApp(SAP_Test_Data_BSEG_Table, '/app_SAP_Test_Data_BSEG_Table')
site.addApp(SAP_Test_Data_GLT0_Table, '/app_SAP_Test_Data_GLT0_Table')
site.addApp(SAP_Test_Data_GLT0_Table_for_Atomation(1), '/app_SAP_Test_Data_GLT0_Table_for_Atomation(1)')
site.addApp(SAP_Test_Data_GLT0_Table_for_Atomation(1)_copy, '/app_SAP_Test_Data_GLT0_Table_for_Atomation(1)_copy')
site.addApp(SAP_Test_Data_GLT0_Table_for_automation, '/app_SAP_Test_Data_GLT0_Table_for_automation')
site.addApp(SAP_Test_Data_GLT0_Table_for_automation_copy, '/app_SAP_Test_Data_GLT0_Table_for_automation_copy')
site.launch(port=8082)
