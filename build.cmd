@echo off
%~d0
cd %~dp0
set path=%path%;%~dp0\bin\

::生成配置文件
gn gen out

::清理缓存
del out\out\app.cls.o /q
del out\out\handler.o /q

ninja -C "out" -j 5
::TODO：在这里把插件复制到框架位置便于调试 copy out\*.dll C:\frame\main\plugin\