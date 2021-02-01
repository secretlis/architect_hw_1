import os

from sanic import Sanic
from sanic.response import json

app = Sanic("architect_hw_1_app")


@app.route("/")
async def root(request):
    return json({'result': 'Hello world from ' + os.environ['HOSTNAME'] + '!'})


@app.route("/health/")
async def health(request):
    return json({"status": "OK"})
