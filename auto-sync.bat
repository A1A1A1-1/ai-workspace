@echo off
chcp 65001 >nul
title AI自动同步 - 巴特鹿传话筒
echo ========================================
echo   AI自动同步已启动！
echo   我会每30秒自动把你的代码同步到GitHub
echo   巴特鹿会自动看到并给反馈
echo   关掉这个窗口就停止同步
echo ========================================
echo.

:loop
git add -A 2>nul
git diff --cached --quiet
if %errorlevel% neq 0 (
    git commit -m "auto sync %date% %time%" 2>nul
    git push origin main 2>nul
    echo [%time%] 已同步
) else (
    echo [%time%] 无变化，等待中...
)
timeout /t 30 /nobreak >nul
goto loop
