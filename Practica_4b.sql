SAVEPOINT PREROLES;
--No creamos usuarios con la idea de que, en el mismo momento del acceso a la creación de un usuario, se "decidirá" con que roles (y con qué grants en casos concretos) accederán.
CREATE ROLE USUARIOMEDIO;
GRANT CONNECT ON _view TO USUARIOMEDIO;

CREATE ROLE PROPIETARIO;
GRANT CONNECT TO PROPIETARIO;

CREATE ROLE PRODUCTOR;
GRANT INSERT,UPDATE,DELETE ON PRODUCCIONENERGIA TO PRODUCTOR;
GRANT INSERT,UPDATE,DELETE ON CENTRALES TO PRODUCTOR;

CREATE ROLE RESPONSABLE;
GRANT RESOURCE TO RESPONSABLE;

SAVEPOINT POSTROLES;

CREATE VIEW productor_view(Denominacion,Tipo)
AS
SELECT Denom,Tipo
FROM productores;

GRANT INSERT,UPDATE,DELETE,SELECT,CREATE VIEW ON productor_view TO PRODUCTOR;
 
CREATE VIEW vistacentrales(Nombre,Propietario,Produccion,Pais)
AS
SELECT c.denom,prop.denom,pr.cantidad,c.pais FROM centrales c INNER JOIN productores prop ON c.codcentral=pr.codcentral;

CREATE MATERIALIZED VIEW productores_view
AS
SELECT p.nombre,p.apell1,p.apell2,p.pais,r.codredesdistribucion,r.denom FROM productores p INNER JOIN 

CREATE VIEW entregaelectricidad_view(Cantidad,CodEstacion,NIF_productor)
AS
SELECT e.cantidadenergia,e.codestacion,p.nif FROM estacionesprimarias e INNER JOIN productores p ON p.nif=e.nif;

CREATE VIEW consumir_view
AS
SELECT c.nif,z.codzonaservicio,c.cantidad FROM consumidor c INNER JOIN zonasservicio z ON c.nif=z.nif; --?

COMMIT;