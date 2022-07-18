SELECT * FROM tblproductos WHERE (SELECT intCantidad,intIdproducto FROM tblventa WHERE(SELECT * ) );
SELECT tblproductos.`vchNombre`
FROM tblproductos INNER JOIN tblventa ON tblproductos.`intIdproducto`= tblventa.`intIdproducto`
WHERE (SELECT * FROM tblventa tblventa.`fltPrecio`=2000);
CREATE DATABASE	bdproyecto;
USE bdproyecto;
