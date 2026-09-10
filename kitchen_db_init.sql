-- Create kitchen_db if not exists
CREATE DATABASE IF NOT EXISTS kitchen_db
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE kitchen_db;

-- Kitchen tickets
CREATE TABLE IF NOT EXISTS kitchen_tickets (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    order_id BIGINT NOT NULL UNIQUE,
    status VARCHAR(50) NOT NULL DEFAULT 'PENDING',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_status (status),
    INDEX idx_order_id (order_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Ticket items
CREATE TABLE IF NOT EXISTS ticket_items (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    ticket_id BIGINT NOT NULL,
    menu_item_id BIGINT NOT NULL,
    quantity INT NOT NULL,
    notes TEXT,
    FOREIGN KEY (ticket_id) REFERENCES kitchen_tickets(id) ON DELETE CASCADE,
    INDEX idx_ticket_id (ticket_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
