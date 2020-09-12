import base64
import requests
import datetime
import os
import io
import json
import yaml

def GET(url):
    ''''''
    # _url = 'https://api.github.com/repos/{user}/{repo_name}/contents/{path_to_file}'.format(user='tsj7ww',repo_name='ref',path_to_file='README.md')
    _r = requests.get(url)
    if _r.status_code == requests.codes.ok:
        return json.loads(base64.b64decode(req.json()['content']).decode('utf-8'))
    else:
        raise Exception('Content was not found.')


def CONFIG(meta,env):
    ''''''
    _now = datetime.datetime.now()
    _cwd = os.getcwd()

    _cfg = {
        'now': _now,
        'cwd': _cwd,
        'uid': 'tsj7ww',
        'pid': 'test_config'
    }

    return _cfg
