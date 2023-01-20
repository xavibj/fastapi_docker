from fastapi import FastAPI
from routers import test


app = FastAPI(root_path='')

app.include_router(test.router)
