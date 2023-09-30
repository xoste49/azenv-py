from flask import Flask, request, render_template

app = Flask(__name__)


@app.route('/')
def get_headers():
    headers = dict(request.environ)
    new_headers = {}

    for k, v in headers.items():
        if k.startswith('wsgi') or k.startswith('werkzeug') or k.startswith('gunicorn'):
            continue
        else:
            new_headers[k] = v

    # Sort
    new_headers_keys = list(new_headers.keys())
    new_headers_keys.sort()
    new_headers_sorted = {i: new_headers[i] for i in new_headers_keys}

    result = '\n'.join([f"{k} = {v}" for k, v in new_headers_sorted.items()])
    return render_template('index.html', result=result)
