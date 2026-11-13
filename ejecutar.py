import sqlite3
from pathlib import Path

Path("tienda_discos.db").unlink(missing_ok=True)

conexion = sqlite3.connect("tienda_discos.db")

conexion.execute("PRAGMA foreign_keys = ON")

conexion.executescript(Path("schema.sql").read_text(encoding="utf-8"))
conexion.executescript(Path("datos.sql").read_text(encoding="utf-8"))
conexion.commit()

print("Filas por tabla:")
for tabla in ["artistas", "generos", "discos", "clientes", "ventas", "detalle_venta"]:
    cantidad=conexion.execute(f"SELECT COUNT(*) FROM {tabla}").fetchone()[0]
    print(f" {tabla}: {cantidad}")

texto = Path("consultas.sql").read_text(encoding="utf-8")
for consulta in texto.split(";"):
    consulta = consulta.strip()
    if not consulta:
        continue
    cursor = conexion.execute(consulta)
    if cursor.description is None:
        continue

    titulo = next((l[2:].strip() for l in consulta.splitlines() if l.startswith("--") and l[2:].strip()[:1].isdigit()), "Consulta")
    print()
    print("=" * 60)
    print(titulo)
    print("-" * 60)
    print(" | ".join(columna[0] for columna in cursor.description))
    for fila in cursor.fetchall():
        print(" | ".join(str(valor) for valor in fila))

conexion.close()