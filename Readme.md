# hello-copilot (ejecución local)

Pequeña API en FastAPI que muestra el texto "piiensa un numero del 1 al 10" y devuelve un número aleatorio entre 1 y 10.

## Requisitos en macOS

- Python 3 (recomendado 3.8+). Si no lo tienes:
  - Con Homebrew: `brew install python`
- Terminal (Terminal.app, iTerm, etc.)

## Pasos para ejecutar localmente

1. Clona o sitúa los archivos en una carpeta y entra en ella.

2. Crear y activar un entorno virtual:
   - `python3 -m venv .venv`
   - `source .venv/bin/activate`

3. Instalar dependencias:
   - `pip install --upgrade pip`
   - `pip install -r requirements.txt`

4. Ejecutar la aplicación:
   - `python3 main.py`

   Esto iniciará el servidor en `http://127.0.0.1:8000/`.

5. Probar:
   - Abre en el navegador: `http://127.0.0.1:8000/`
   - O desde la terminal: `curl http://127.0.0.1:8000/`

Ejemplo de respuesta JSON:
```json
{
  "prompt": "piiensa un numero del 1 al 10",
  "numero": 7
}
```

## Notas
- Si prefieres usar `uvicorn` directamente con autoreload durante desarrollo:
  - `uvicorn main:app --reload --host 127.0.0.1 --port 8000`
- Si tienes un error de configuración en tu entorno (por ejemplo el mensaje `CONFIG ERROR` que mostraste), dime exactamente qué aparece y la salida completa y te ayudo a resolverlo.