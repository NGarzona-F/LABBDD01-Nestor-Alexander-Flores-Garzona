Use ComercialDB;
-- Crear usuarios
CREATE USER IF NOT EXISTS 'admin_user'@'localhost' IDENTIFIED BY 'admin_password';
CREATE USER IF NOT EXISTS 'normal_user'@'localhost' IDENTIFIED BY 'user_password';
CREATE USER IF NOT EXISTS 'mod_user'@'localhost' IDENTIFIED BY 'mod_password';

-- Asignación de privilegios
-- Conceder todos los privilegios al usuario administrador
GRANT ALL PRIVILEGES ON ComercialDB.* TO 'admin_user'@'localhost';

-- Conceder privilegios de solo lectura al usuario normal
GRANT SELECT ON ComercialDB.* TO 'normal_user'@'localhost';

-- Conceder privilegios de lectura y actualización al moderador
GRANT SELECT, UPDATE ON ComercialDB.* TO 'mod_user'@'localhost';

-- Aplicar los cambios
FLUSH PRIVILEGES;
