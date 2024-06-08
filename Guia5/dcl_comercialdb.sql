
-- Crear roles
CREATE ROLE rol_admin;
CREATE ROLE rol_usuario;
CREATE ROLE rol_moderador;

-- Crear usuarios y asignar roles
CREATE USER 'admin_user'@'localhost' IDENTIFIED BY 'admin_password';
GRANT rol_admin TO 'admin_user'@'localhost';

CREATE USER 'normal_user'@'localhost' IDENTIFIED BY 'user_password';
GRANT rol_usuario TO 'normal_user'@'localhost';

CREATE USER 'mod_user'@'localhost' IDENTIFIED BY 'mod_password';
GRANT rol_moderador TO 'mod_user'@'localhost';

-- Asignación de privilegios
GRANT ALL PRIVILEGES ON ComercialDB.* TO 'admin_user'@'localhost';
GRANT SELECT ON ComercialDB.* TO 'normal_user'@'localhost';
GRANT SELECT, UPDATE ON ComercialDB.* TO 'mod_user'@'localhost';
