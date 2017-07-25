# -*- coding: utf-8 -*-
from sanic import Sanic
from sanic.response import json,text

app = Sanic("Project_AI")

@app.route("/")
async def test(request):
    return text("Hello world")

app.run(host="0.0.0.0", port=8000,debug=True)

