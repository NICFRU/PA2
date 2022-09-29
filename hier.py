import IPython.nbformat.current as convert
conv = convert.read(open('test.py', 'r'), 'py')
convert.write(conv, open('source.ipynb', 'w'), 'ipynb')