from fastapi import FastAPI
from typing import Annotated

from sqlmodel import Field, Session, SQLModel, create_engine, select

class User(SQLModel, table=True):
    __tablename__ = "custom_user"
    id: int = Field(default=None, primary_key=True)
    username: str
    email: str
    hashed_password: str

DATABASE_URL = "postgresql://olive:test@postgis/test_db"

engine = create_engine(DATABASE_URL, echo=True)

def init_db():
    SQLModel.metadata.drop_all(engine)
    SQLModel.metadata.create_all(engine)

app = FastAPI()

@app.on_event("startup")
def on_startup():
    init_db()