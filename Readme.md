# hello-copilot (ejecución local)

Pequeña API en FastAPI que muestra el texto "piiensa un numero del 1 al 10" y devuelve un número aleatorio entre 1 y 10.


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

### Ejercicio 

1. 
     - Agrega una función que piense los números del 1 al 20 y espere 10 segundos antes de responder.
     - Sube los cambios a la rama feature/prueba en el repositorio de GitHub.

COPILOT_API_KEY

 ● Para obtener el COPILOT_API_KEY debes ir a https://github.com/settings/copilot y generar un
   "Personal Access Token" (PAT) con permisos para Copilot.
   Luego, en tu repositorio de GitHub, ve a Settings > Secrets and variables > Actions > New
   repository secret, y agrega el token con el nombre COPILOT_API_KEY.
   Así el workflow podrá usar Copilot CLI con tu clave.

GEMINI_API_KEY
¿Cómo obtener tu API Key?

Ve a: https://makersuite.google.com/app/apikey
2. Inicia sesión con tu cuenta Google
Clic en “Create API Key”
Copia la key (se ve así: `AIzaSyXXXXXXXXXXXXXXXXX`)
¡Listo! Ahora puedes usar Gemini