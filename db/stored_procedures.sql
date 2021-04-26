/*
Stored Procedure SP_GetCustomers()
*/
delimiter //
CREATE PROCEDURE SP_GetCustomers()
begin
	select * from clientes;
end //
/*
Stored Procedure SP_GetProductPrice()
*/
delimiter //
CREATE  PROCEDURE SP_GetProductPrice(
in _id_productos int
)
begin
	select precio 
    from productos
    where id_producto = _id_productos;
end //
/*
Stored Procedure SP_GetProducts()
*/
delimiter //
CREATE PROCEDURE SP_GetProducts()
begin
 select * from productos;
 end //
/*
Stored Procedure SP_GetSales()
*/
 delimiter //
 CREATE  PROCEDURE SP_GetSales(
)
begin
	select v.id_venta, c.nombre, c.apellidos, v.total, v.fecha
    from ventas as v
    inner join clientes as c
    where v.clientes_id_cliente = c.id_cliente;
end //
/*
Stored Procedure SP_InsertCustomer()
*/
delimiter //
CREATE PROCEDURE SP_InsertCustomer(
in _nombre varchar(45),
in _apellidos varchar(45)
)
begin 
	insert into clientes (nombre, apellidos) values (_nombre, _apellidos);
end //
/*
Stored Procedure SP_InsertDetailSale()
*/
delimiter //
CREATE  PROCEDURE SP_InsertDetailSale(
	in _ventas_id_venta int,
    in _productos_id_producto int,
    in _cantidad int,
    in _precio decimal(7,2)
 )
begin
  insert into detalle_venta (ventas_id_venta, productos_id_producto, cantidad, precio)
  values (_ventas_id_venta, _productos_id_producto,_cantidad , _precio );
end //
/*
Stored Procedure SP_InsertProduct()
*/
delimiter //
CREATE PROCEDURE SP_InsertProduct(
in _nombre nvarchar(45), 
in _precio decimal(10)
)
begin
	insert into productos (nombre, precio) values (_nombre, _precio);
end //
/*
Stored Procedure SP_InsertSale()
*/
delimiter //
CREATE  PROCEDURE SP_InsertSale(
in _id_cliente int
)
begin
 insert into ventas (clientes_id_cliente, fecha) 
 values(_id_cliente, now());
 select id_venta 
 from ventas 
 order by id_venta desc 
 limit 1;
 end //
/*
Trigger calcularSubtotal
*/
 delimiter //
 CREATE trigger calcularSubtotal
before insert on detalle_venta
for each row 
begin 
	set new.subtotal = new.precio * new.cantidad;
end //
delimiter ;

