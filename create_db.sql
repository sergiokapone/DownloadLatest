-- create_db.sql

CREATE TABLE IF NOT EXISTS repos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    repo_url TEXT NOT NULL,
    pattern TEXT NOT NULL,
    download_dir TEXT NOT NULL DEFAULT 'C:\\Downloads'
);

-- Добавим примеры
INSERT INTO repos (name, repo_url, pattern) VALUES
    ('TeXstudio', 'texstudio-org/texstudio', '*win-portable-qt6.zip'),
    ('PowerShell', 'PowerShell/PowerShell', '*win-x64.zip'),
    ('yt-dlp', 'yt-dlp/yt-dlp', '*win64.zip');
