@echo off
echo ========================================
echo    TESTING MEDICAL RECORDS SYSTEM
echo ========================================
echo.

echo [1] Checking database connection...
php artisan tinker --execute="echo 'Database connected: ' . (DB::connection()->getPdo() ? 'YES' : 'NO');"

echo.
echo [2] Checking existing data...
php artisan test:medical-records

echo.
echo [3] Starting Laravel server...
echo Server will start at: http://localhost:8000
echo Press Ctrl+C to stop the server
echo.
php artisan serve

pause
