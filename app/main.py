from fastapi import FastAPI
import os
import uvicorn

app_env = os.getenv("APP_ENV", "development")

app = FastAPI(title=f"FastAPI App - {app_env}")

@app.get("/")
def read_root():
    return {"status": "online", "msg": "Optimization Task - Stage 1"}

@app.get("/health")
def health():
    return {"status": "healthy"}

if __name__ == "__main__":
    port = int(os.getenv("APP_PORT", 6767))
    uvicorn.run(app, host="0.0.0.0", port=port)
