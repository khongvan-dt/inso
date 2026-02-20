@echo off
chcp 65001 >nul
echo Đang khởi động server tại: %cd%
echo.
echo Sau vài giây trình duyệt sẽ mở http://localhost:8080/print.html
echo Dữ liệu từ data.html sẽ hiển thị ngay trên màn hình.
echo Nhấn Ctrl+C để tắt server.
echo.

REM Mở trình duyệt sau 2 giây (để server kịp chạy)
start /b cmd /c "timeout /t 2 /nobreak >nul && start http://localhost:8080/print.html"

python -m http.server 8080 2>nul
if errorlevel 1 (
    echo Python không có. Thử Node.js...
    npx -y serve -p 8080 2>nul
    if errorlevel 1 (
        echo.
        echo Cần cài Python hoặc Node.js để chạy server.
        echo - Python: https://www.python.org/downloads/
        echo - Node.js: https://nodejs.org/
        pause
    )
)
