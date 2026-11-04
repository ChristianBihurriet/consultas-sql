"""Genera datos/tienda.db para el laboratorio (solo biblioteca estandar)."""
from pathlib import Path
import random
import sqlite3

RUTA = Path(__file__).parent / "datos" / "tienda.db"
random.seed(20261103)

CLIENTES = [
    ("Ana", "Martín", "Madrid"), ("Bruno", "López", "Barcelona"), ("Carla", "Santos", "Valencia"),
    ("Diego", "Ruiz", "Sevilla"), ("Elena", "Vega", "Bilbao"), ("Fabio", "Mora", "Zaragoza"),
    ("Gloria", "Navas", "Málaga"), ("Hugo", "Gil", "Murcia"), ("Inés", "Costa", "Alicante"),
    ("Jorge", "Ramos", "Valladolid"), ("Karla", "Serrano", "Madrid"), ("Luis", "Ortega", "Barcelona"),
    ("Marta", "Pardo", "Valencia"), ("Nacho", "Sanz", "Sevilla"), ("Olga", "Lara", "Bilbao"),
    ("Pablo", "León", "Zaragoza"), ("Raquel", "Cano", "Málaga"), ("Sergio", "Nieto", "Murcia"),
    ("Teresa", "Vidal", "Alicante"), ("Unai", "Bravo", "Valladolid"), ("Verónica", "Díaz", "Madrid"),
    ("Walter", "Ferrer", "Barcelona"), ("Xenia", "Prieto", "Valencia"), ("Yago", "Roca", "Sevilla"),
    ("Zoe", "Calvo", "Bilbao"), ("Adrián", "Iglesias", "Zaragoza"), ("Beatriz", "Rey", "Málaga"),
    ("César", "Sierra", "Murcia"), ("Diana", "Paz", "Alicante"), ("Esther", "Núñez", "Valladolid"),
    ("Félix", "Beltrán", "Madrid"), ("Gema", "Vera", "Barcelona"), ("Iván", "Méndez", "Valencia"),
    ("Julia", "Solís", "Sevilla"), ("Kevin", "Peña", "Bilbao"), ("Laura", "Bello", "Zaragoza"),
    ("Mario", "Durán", "Málaga"), ("Noelia", "Cruz", "Murcia"), ("Óscar", "Bueno", "Alicante"),
    ("Patricia", "Mena", "Valladolid"), ("Quim", "Pastor", "Madrid"), ("Rita", "Rubio", "Barcelona"),
    ("Samuel", "Tello", "Valencia"), ("Tamara", "Funes", "Sevilla"), ("Uriel", "Blanco", "Bilbao"),
    ("Violeta", "Parra", "Zaragoza"), ("William", "Molina", "Málaga"), ("Ximena", "Arias", "Murcia"),
    ("Yeray", "Montero", "Alicante"), ("Zaida", "Luna", "Valladolid"),
]
CATEGORIAS = [("Informática", "Equipos y accesorios"), ("Oficina", "Material para estudiar y trabajar"),
              ("Hogar", "Pequeños artículos para casa"), ("Deporte", "Accesorios deportivos"),
              ("Libros", "Lecturas y consulta"), ("Audio", "Sonido y música"),
              ("Fotografía", "Cámaras y accesorios"), ("Jardín", "Cuidado de plantas")]
NOMBRES = [
    "Ratón inalámbrico", "Teclado compacto", "Monitor 24 pulgadas", "Memoria USB 64 GB", "Base para portátil",
    "Cuaderno cuadriculado", "Bolígrafo azul", "Archivador A4", "Lámpara de escritorio", "Calculadora básica",
    "Taza térmica", "Cojín lumbar", "Organizador de cables", "Botella reutilizable", "Manta ligera",
    "Esterilla de yoga", "Banda elástica", "Balón de entrenamiento", "Toalla deportiva", "Candado para bicicleta",
    "Novela histórica", "Guía de programación", "Diccionario escolar", "Libro de recetas", "Cómic clásico",
    "Auriculares con cable", "Altavoz portátil", "Micrófono USB", "Adaptador de audio", "Radio compacta",
    "Trípode ligero", "Funda para cámara", "Tarjeta SD 128 GB", "Luz LED", "Correa de cámara",
    "Maceta cerámica", "Regadera pequeña", "Guantes de jardín", "Semillas aromáticas", "Tijeras de poda",
]

def crear():
    RUTA.parent.mkdir(exist_ok=True)
    if RUTA.exists(): RUTA.unlink()
    con = sqlite3.connect(RUTA)
    con.execute("PRAGMA foreign_keys = ON")
    con.executescript("""
    CREATE TABLE clientes (
      id_cliente INTEGER PRIMARY KEY, nombre TEXT NOT NULL, apellidos TEXT NOT NULL,
      email TEXT NOT NULL UNIQUE, telefono TEXT, ciudad TEXT NOT NULL,
      fecha_alta TEXT NOT NULL CHECK(fecha_alta GLOB '????-??-??')
    );
    CREATE TABLE categorias (
      id_categoria INTEGER PRIMARY KEY, nombre TEXT NOT NULL UNIQUE, descripcion TEXT
    );
    CREATE TABLE productos (
      id_producto INTEGER PRIMARY KEY, nombre TEXT NOT NULL, id_categoria INTEGER NOT NULL,
      precio REAL NOT NULL CHECK(precio >= 0), stock INTEGER NOT NULL CHECK(stock >= 0),
      activo INTEGER NOT NULL DEFAULT 1 CHECK(activo IN (0,1)), descripcion TEXT,
      FOREIGN KEY(id_categoria) REFERENCES categorias(id_categoria)
    );
    CREATE TABLE pedidos (
      id_pedido INTEGER PRIMARY KEY, id_cliente INTEGER NOT NULL, fecha_pedido TEXT NOT NULL,
      estado TEXT NOT NULL CHECK(estado IN ('Pendiente','Enviado','Entregado','Cancelado')),
      direccion_envio TEXT, observaciones TEXT,
      FOREIGN KEY(id_cliente) REFERENCES clientes(id_cliente)
    );
    CREATE TABLE detalle_pedido (
      id_detalle INTEGER PRIMARY KEY, id_pedido INTEGER NOT NULL, id_producto INTEGER NOT NULL,
      cantidad INTEGER NOT NULL CHECK(cantidad > 0), precio_unitario REAL NOT NULL CHECK(precio_unitario >= 0),
      FOREIGN KEY(id_pedido) REFERENCES pedidos(id_pedido),
      FOREIGN KEY(id_producto) REFERENCES productos(id_producto)
    );
    CREATE TABLE pagos (
      id_pago INTEGER PRIMARY KEY, id_pedido INTEGER NOT NULL UNIQUE, fecha_pago TEXT,
      importe REAL NOT NULL CHECK(importe >= 0), metodo TEXT NOT NULL CHECK(metodo IN ('Tarjeta','Bizum','Transferencia')),
      estado_pago TEXT NOT NULL CHECK(estado_pago IN ('Pagado','Pendiente')),
      FOREIGN KEY(id_pedido) REFERENCES pedidos(id_pedido)
    );
    """)
    con.executemany("INSERT INTO categorias(nombre, descripcion) VALUES (?,?)", CATEGORIAS)
    clientes = [(n, a, f"{n.lower().replace('é','e').replace('ó','o').replace('á','a')}.{a.lower().replace('í','i').replace('ñ','n')}@correo.es", None if i % 9 == 0 else f"6{10000000+i:08d}", c, f"202{2+i%3}-{1+i%12:02d}-{1+i%27:02d}") for i,(n,a,c) in enumerate(CLIENTES,1)]
    con.executemany("INSERT INTO clientes(nombre,apellidos,email,telefono,ciudad,fecha_alta) VALUES (?,?,?,?,?,?)", clientes)
    productos = []
    for i in range(80):
        base = NOMBRES[i % 40]
        nombre = base if i < 40 else base + " Plus"
        productos.append((nombre, i // 10 + 1, round(4.95 + ((i * 13) % 170) + (i % 5) * .5, 2), 5 + (i * 9) % 95, 0 if i in (67, 78) else 1, None if i % 7 == 0 else f"{nombre} para uso diario."))
    con.executemany("INSERT INTO productos(nombre,id_categoria,precio,stock,activo,descripcion) VALUES (?,?,?,?,?,?)", productos)
    estados = ['Entregado', 'Enviado', 'Pendiente', 'Cancelado']
    pedidos = []
    for i in range(1,151):
        cliente = 1 + (i * 7) % 45  # los clientes 46 a 50 no tienen pedidos
        estado = estados[(i * 3) % 4]
        pedidos.append((cliente, f"2026-{1+(i%10):02d}-{1+(i*3%27):02d}", estado,
                        None if i % 8 == 0 else f"Calle {i}, {CLIENTES[cliente-1][2]}", None if i % 11 else "Entregar por la tarde"))
    con.executemany("INSERT INTO pedidos(id_cliente,fecha_pedido,estado,direccion_envio,observaciones) VALUES (?,?,?,?,?)", pedidos)
    detalles = []
    for pedido in range(1,151):
        for linea in range(3 if pedido <= 100 else 2):
            prod = 1 + (pedido * 3 + linea * 11) % 70  # productos 71-80 sin ventas
            precio = productos[prod-1][2]
            detalles.append((pedido, prod, 1 + (pedido + linea) % 4, precio))
    con.executemany("INSERT INTO detalle_pedido(id_pedido,id_producto,cantidad,precio_unitario) VALUES (?,?,?,?)", detalles)
    totales = dict(con.execute("SELECT id_pedido, SUM(cantidad*precio_unitario) FROM detalle_pedido GROUP BY id_pedido"))
    pagos = []
    for pedido in range(1,131):
        pendiente = pedido % 13 == 0
        pagos.append((pedido, None if pendiente else f"2026-{1+(pedido%10):02d}-{2+(pedido%25):02d}", totales[pedido], ['Tarjeta','Bizum','Transferencia'][pedido%3], 'Pendiente' if pendiente else 'Pagado'))
    con.executemany("INSERT INTO pagos(id_pedido,fecha_pago,importe,metodo,estado_pago) VALUES (?,?,?,?,?)", pagos)
    con.commit()
    errores = list(con.execute("PRAGMA foreign_key_check"))
    assert not errores, errores
    con.close()

if __name__ == '__main__':
    crear()
