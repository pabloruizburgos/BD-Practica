create index centrales_idx on centrales(codcentral,denom);

create index prodenergia_idx on produccionenergia(fecha,hora,contidad);

create index alertas_idx on alertas(codalerta,tipo);

create index responsable_idx on responsable(nif,nombreusuariocu,dominiocu,idpais,idregion,numtlf);

create index suministrador_idx on suminnistrador(nif,nombre);

create index empresatransporte_idx on empresatransporte(nif,codautoriz,dominio,nombreusuario);

create index residuos_idx on residuos(fecha,hora,contidad);

create index redesdistribucion_idx on redesdistribucion(numred);

create index linea_idx on linea(numlinea);

create index estaciones_idx on estaciones(codestacion);

create index zonasservicio_idx on zonasservicio(codzonaservicio,consumomedio);

create index provincias_idx on provincias(codprovincia,nombre);

create index consumidor_idx on consumidor(nif,tipo);