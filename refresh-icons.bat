@echo off
rem 检测是否为管理员权限，如果不是，则请求管理员权限
Net session >nul 2>&1 || mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0","","runas",1)(window.close)&&exit

rem 关闭 Windows 资源管理器
taskkill /f /im explorer.exe

rem 删除图标缓存数据库
attrib -h -s -r "%userprofile%\AppData\Local\IconCache.db"
del /f "%userprofile%\AppData\Local\IconCache.db"

rem 重启 Windows 资源管理器
start explorer
