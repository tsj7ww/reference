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
    response = requests.get(url)
    if response.status_code == requests.codes.ok:
        return json.loads(base64.b64decode(response.json()['content']).decode('utf-8'))
    else:
        raise Exception('Content was not found.')


def CONFIG(meta,env):
    ''''''
    cwd = os.getcwd()

    now = datetime.datetime.now()
    dt = '%Y%m%d'
    dttm = '%Y%m%d_%H%M%S'

    proc = ''
    pid = ''

    eid = ''
    eml = ''


    cfg = {
        'now': now,
        'cwd': cwd,
        'eid': eid,
        'proc': proc,
        'pid': pid,
        'aws': {}
    }

    return cfg
