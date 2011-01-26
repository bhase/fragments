setlocal makeprg=cscript\ //nologo\ C:\DOKUME~1\haseb\ParseAndRunDxlFile.vbs\ %:p
setlocal efm=-E-\ DXL:\ <Line:%l>\ %m,-E-\ DXL:\ <%f:%l>\ %m,-R-E-\ DXL:\ <Line:%l>\ %m,-R-E-\ DXL:\ <%f:%l>\ %m
