from fastapi import FastAPI
import random
import uvicorn

app = FastAPI()

@app.get("/")
async def read_root():
    """
    Respuesta JSON con el prompt en español y una lista de números del 1 al 20, espera 10 segundos.
    """
    import asyncio
    numeros = list(range(1, 21))
    await asyncio.sleep(10)
    return {
        "prompt": "Piensa un numero del 1 al 20",
        "numeros": numeros
    }

if __name__ == "__main__":
    # Ejecuta con: python3 main.py
    uvicorn.run("main:app", host="127.0.0.1", port=8000)