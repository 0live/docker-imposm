from sqlmodel import create_engine, SQLModel
import models

DATABASE_URL = "postgresql://olive:test@postgis/test_db"

engine = create_engine(DATABASE_URL, echo=True)

def init_db():
    SQLModel.metadata.drop_all(engine)
    SQLModel.metadata.create_all(engine)