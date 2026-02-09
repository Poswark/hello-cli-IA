from fastapi import FastAPI
import random
import uvicorn

app = FastAPI()

@app.get("/")
async def read_root():
    """
    Respuesta JSON con el prompt en español y un número aleatorio del 1 al 10.
    """
    numero = random.randint(1, 10)
    return {
        "prompt": "Piensa un numero del 1 al 10",
        "numero": numero
    }
    print()

if __name__ == "__main__":
    # Ejecuta con: python3 main.py
    uvicorn.run("main:app", host="127.0.0.1", port=8000)