-- Create media_db if not exists
CREATE DATABASE IF NOT EXISTS media_db
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE media_db;

-- Media table
CREATE TABLE IF NOT EXISTS media (
    id VARCHAR(36) PRIMARY KEY,
    owner_type VARCHAR(50) NOT NULL,
    owner_id BIGINT NOT NULL,
    file_path VARCHAR(500) NOT NULL,
    content_type VARCHAR(100) NOT NULL,
    file_size BIGINT NOT NULL,
    is_primary BOOLEAN DEFAULT FALSE,
    checksum VARCHAR(64),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_owner (owner_type, owner_id),
    INDEX idx_primary (is_primary)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
