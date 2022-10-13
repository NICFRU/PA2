import os
#open -a "Google Chrome" http://127.0.0.1:8082/ && python manage.py runserver
a=os.system('cmd /k "start  http://127.0.0.1:8082/"')
b=os.system('cmd /k "python multi_app.py"')
print(b)
print(a)
