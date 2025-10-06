from flask import Flask
import os

app = Flask(__name__)

@app.route('/')
def home():
    container_id = os.uname()[1]
    return f"Response from container (ID): {container_id}\n"
