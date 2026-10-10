-- 1. Crear la Base de Datos
CREATE DATABASE PokemonDB;
GO

-- 2. Seleccionar la Base de Datos para trabajar en ella
USE PokemonDB;
GO

-- 3. Crear Tabla Tipos
CREATE TABLE Tipos (
    IdTipo INT PRIMARY KEY IDENTITY(1,1),
    NombreTipo VARCHAR(50) NOT NULL UNIQUE
);
GO

-- 4. Crear Tabla Pokemons
CREATE TABLE Pokemons (
    ID INT PRIMARY KEY IDENTITY(1,1),
    Numero INT NOT NULL UNIQUE,
    Nombre VARCHAR(50) NOT NULL,
    Descripcion VARCHAR(255) NOT NULL,
    ImagenUrl VARCHAR(500) NOT NULL,
    IdTipo INT NOT NULL,
    IdDebilidad INT NOT NULL,
    IdEvolucion INT NULL,
    Activo BIT NOT NULL DEFAULT 1,
    
    FOREIGN KEY (IdTipo) REFERENCES Tipos(IdTipo),
    FOREIGN KEY (IdDebilidad) REFERENCES Tipos(IdTipo),
    FOREIGN KEY (IdEvolucion) REFERENCES Pokemons(ID)
);
GO

-- =========================================================
-- INSERCIÓN DE DATOS DE PRUEBA
-- =========================================================

-- Cargar Tipos
INSERT INTO Tipos (NombreTipo) VALUES 
('Planta'), ('Fuego'), ('Agua'), ('Eléctrico'), ('Veneno'),
('Volador'), ('Bicho'), ('Tierra'), ('Psíquico'), ('Roca');
GO

-- Cargar Pokémons
INSERT INTO Pokemons (Numero, Nombre, Descripcion, ImagenUrl, IdTipo, IdDebilidad, IdEvolucion, Activo) VALUES
(1, 'Bulbasaur', 'Una rara semilla fue plantada en su espalda al nacer. El brote crece lentamente.', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png', 1, 2, NULL, 1),
(2, 'Ivysaur', 'Cuando el bulbo de su espalda crece, parece perder la capacidad de ponerse de pie sobre sus patas traseras.', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/2.png', 1, 2, NULL, 1),
(3, 'Venusaur', 'La planta florece cuando absorbe energía solar. Permanece en movimiento para buscar la luz del sol.', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/3.png', 1, 2, NULL, 1),
(4, 'Charmander', 'Prefiere las cosas calientes. Dicen que cuando llueve le sale vapor de la punta de la cola.', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/4.png', 2, 3, NULL, 1),
(5, 'Charmeleon', 'Es muy agresivo. Al blandir su ardiente cola, eleva la temperatura a niveles insoportables.', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/5.png', 2, 3, NULL, 1),
(6, 'Charizard', 'Escupe fuego tan caliente que puede fundir rocas. Causa incendios forestales sin querer.', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/6.png', 2, 3, NULL, 1),
(7, 'Squirtle', 'Cuando retrae su largo cuello en la concha, dispara agua a una presión formidable.', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/7.png', 3, 1, NULL, 1),
(8, 'Wartortle', 'Es muy popular como mascota. Su cola peluda es un símbolo de longevidad.', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/8.png', 3, 1, NULL, 1),
(9, 'Blastoise', 'Un Pokémon brutal con cañones de agua en su caparazón. Sus disparos de agua pueden perforar el acero.', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/9.png', 3, 1, NULL, 1),
(25, 'Pikachu', 'Cuando se reune con otros de su especie, la electricidad de sus mejillas puede provocar tormentas eléctricas.', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png', 4, 8, NULL, 1);

GO

Select Numero, Nombre, Descripcion, ImagenUrl From Pokemons ; 

Select * From Pokemons ; 

update Pokemons set ImagenUrl = '' where Numero = 8 ;

use PokemonDB

SELECT 
    p.Numero, 
    p.Nombre, 
    p.Descripcion, 
    p.ImagenUrl, 
    t.NombreTipo AS Elemento, 
    d.NombreTipo AS Debilidad
FROM Pokemons p
INNER JOIN Tipos t ON p.IdTipo = t.IdTipo
INNER JOIN Tipos d ON p.IdDebilidad = d.IdTipo;

SELECT p.Numero, p.Nombre, p.Descripcion, p.ImagenUrl, t.NombreTipo AS Elemento, d.NombreTipo AS Debilidad FROM Pokemons p INNER JOIN Tipos t ON p.IdTipo = t.IdTipo INNER JOIN Tipos d ON p.IdDebilidad = d.IdTipo;

-- Select Numero, Nombre, Descripcion, ImagenUrl, t.NombreTipo as Elemento From Pokemons p, Tipos t Where p.ID = t.IdTipo ; 

use PokemonDB

SELECT * from Tipos ; 

Select IdTipo, NombreTipo from Tipos ; 

Insert into Pokemons (Numero, Nombre, Descripcion, Activo) values (111, '', '', 1)

-- delete from Pokemons Where id = 25 ; 

select * from Pokemons ;


ALTER TABLE Pokemons ALTER COLUMN ImagenUrl VARCHAR(500) NULL;
ALTER TABLE Pokemons ALTER COLUMN IdTipo INT NULL;
ALTER TABLE Pokemons ALTER COLUMN IdDebilidad INT NULL;
GO

GO

Insert into Pokemons Values (99, '', '', '', 1, 1, 1, 1) ;


Use PokemonDB
UPDATE Pokemons 
SET ImagenUrl = 'https://tusitio.com/imagen.png', IdTipo = 1, IdDebilidad = 2 
WHERE ID = 15;

SELECT * FROM Pokemons WHERE ID = 15;

select * from Pokemons ; 

Update Pokemons set Numero = 1, Nombre = '' , Descripcion = ' ' , ImagenUrl = '' , IdTipo = 1, IdDebilidad = 1 Where Id = 1  ;

DELETE from pokemons where id = 3 ; 

update Pokemons set Activo = 0 Where Id = 1 ; 

SELECT p.Numero, p.Nombre, p.Descripcion, p.ImagenUrl, t.NombreTipo AS Elemento, d.NombreTipo AS Debilidad, p.IdTIpo, p.IdDebilidad, p.Id FROM Pokemons p INNER JOIN Tipos t ON p.IdTipo = t.IdTipo INNER JOIN Tipos d ON p.IdDebilidad = d.IdTipo and p.Activo = 1 
and Nombre like '' ;
        
     
