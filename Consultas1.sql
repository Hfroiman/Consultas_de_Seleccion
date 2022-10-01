-- Consulta
-- Apellido, nombres y fecha de ingreso de todos los colaboradores
SELECT
    Apellidos,
    Nombres,
    AñoIngreso
from Colaboradores

-- Apellido, nombres y antigüedad de todos los colaboradores

select
    col.Apellidos,
    col.Nombres,
    col.AñoIngreso,
    DATEDIFF(YEAR,0, GETDATE()-year(col.AñoIngreso)) as Antiguedad
from Colaboradores col

SELECT * from Colaboradores

-- Apellido y nombres de aquellos colaboradores que trabajen part-time.
SELECT
    Apellidos,
    Nombres,
    ModalidadTrabajo
from Colaboradores
where ModalidadTrabajo='P'

select *from Colaboradores

-- Apellido y nombres, antigüedad y modalidad de trabajo de aquellos colaboradores cuyo sueldo sea entre 50000 y 100000.

    SELECT
    Apellidos,
    Nombres,
    Sueldo
from Colaboradores
WHERE Sueldo BETWEEN 50000 AND 100000

-- Apellidos y nombres y edad de los colaboradores con legajos 4, 6, 12 y 25.
SELECT
    Apellidos,
    Nombres,
    DATEDIFF (YEAR, FechaNacimiento, GETDATE()) AS Edad,
    Legajo
from Colaboradores
    WHERE Legajo like '%4' or Legajo like '%6' or Legajo like '%12'or  Legajo like '%24'

-- Todos los datos de todos los productos ordenados por precio de venta. Del más caro al más barato
    SELECT *
    From Productos
    order by Precio desc

-- El nombre del producto más costoso.
SELECT top 1
    Descripcion
    From Productos
    order by Precio desc
 

-- Todos los datos de todos los pedidos que hayan superado el monto de $20000.
     SELECT
      *
     from Pedidos pe
     where pe.Costo>20000
     order by pe.Costo asc

-- Apellido y nombres de los clientes que no hayan registrado teléfono.
    SELECT
        cl.Apellidos,
        cl.Nombres
    FROM Clientes cl
    where cl.Telefono is null 

-- Apellido y nombres de los clientes que hayan registrado mail pero no teléfono.
     SELECT
     CL.Apellidos,
     CL.Nombres 
     from clientes cl
     WHERE CL.Mail IS NOT NULL AND CL.Telefono IS NULL

-- Apellidos, nombres y datos de contacto de todos los clientes.
-- Nota: En datos de contacto debe figurar el número de celular, si no tiene celular el número de teléfono fijo y si no tiene este último el mail. En caso de no tener ninguno de los
-- tres debe figurar 'Incontactable'.

    SELECT
        CL.Apellidos,
        cl.Nombres,
        isnull(cl.Celular, ISNULL (cl.Telefono, cl.Mail)) DatosdeContacto
    FROM CLIENTES cl

-- Apellidos, nombres y medio de contacto de todos los clientes. Si tiene celular debe figurar 'Celular'. Si no tiene celular pero tiene teléfono fijo debe figurar 'Teléfono fijo'
-- de lo contrario y si tiene Mail debe figurar 'Email'. Si no posee ninguno de los tres debe figurar NULL.
SELECT
    CL.Apellidos,
    cl.Nombres,
    isnull(cl.Celular, ISNULL (cl.Telefono, cl.Mail)) DatosdeContacto
FROM CLIENTES cl

-- Todos los datos de los colaboradores que hayan nacido luego del año 2000
    SELECT 
        *
    from Colaboradores col
    where year (col.FechaNacimiento)>2000

-- Todos los datos de los colaboradores que hayan nacido entre los meses de Enero y Julio (inclusive)
    
-- Todos los datos de los clientes cuyo apellido finalice con vocal
-- Todos los datos de los clientes cuyo nombre comience con 'A' y contenga al menos otra 'A'. Por ejemplo, Ana, Anatasia, Aaron, etc
-- Todos los colaboradores que tengan más de 10 años de antigüedad
-- Los códigos de producto, sin repetir, que hayan registrado al menos un pedido
-- Todos los datos de todos los productos con su precio aumentado en un 20%
SELECT
*,
precio + (Precio*0.20) as PrecioAumento
from Productos
-- Todos los datos de todos los colaboradores ordenados por apellido ascendentemente en primera instancia y por nombre descendentemente en
--segunda instancia.
SELECT
    *
from Colaboradores
order by Apellidos asc, Nombres desc