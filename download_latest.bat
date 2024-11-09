@echo off
setlocal enabledelayedexpansion

REM Установить кодировку UTF-8
chcp 65001 >nul

REM Путь к базе данных
set DB_PATH=repositories.db

REM Запрашиваем данные из базы и выполняем загрузку
for /f "tokens=1,2,3 delims=|" %%A in ('sqlite3 -separator "|" %DB_PATH% "SELECT repo_url, pattern, download_dir FROM repos;"') do (
    set "REPO_URL=%%A"
    set "PATTERN=%%B"
    set "DOWNLOAD_DIR=%%C"
    
    REM Создаем папку, если ее нет
    if not exist "!DOWNLOAD_DIR!" mkdir "!DOWNLOAD_DIR!"

    REM Запускаем загрузку через gh CLI
    echo Загрузка последней версии для !REPO_URL! с паттерном !PATTERN!
    gh release download --repo "!REPO_URL!" --pattern "!PATTERN!" --dir "!DOWNLOAD_DIR!"
    
    REM Проверяем код ошибки gh
    if %errorlevel% neq 0 (
        echo Ошибка загрузки для !REPO_URL!. Переходим к следующему.
    ) else (
        echo Успешно загружено в !DOWNLOAD_DIR!
    )
)

endlocal