import json
import yaml

def METADATA(env):
    """Metadata JSON template."""
    meta = {
        "job": {
            "name": "Job Name"
            "id": "job_nm",
            "type": "etl | report | model",
            "schedule": "cron(59 8 ? * SUN *)",
            "platform": "computing service name",
            "intent": "Process description.",
            "artifacts": "path/to/file"
        },
        "owner": {
            "name": "Person  Name",
            "id": "user_id",
            "email": "name@domain.com"
        },
        "stakeholders": [
            {"name": "Person Name","email":"name@domain.com"}
        ],
        "assets": {
            "input": ["files"],
            "output": ["data"],
            "aws": ["services"]
        },
        "changeLog": {
            "2020-09-01": {
                "requestor": "me",
                "modifier": "me",
                "reviewer": "me",
                "purpose": "init"
            }
        }
    }
return meta

def REGISTRATION():
    """Data registration JSON template."""
    reg = {
        "0": {
            "name": "",
            "desc": "",
            "dtype": "",
            "tags": "",
            "default": ""
        },
        "1": {
            "name": "",
            "desc": "",
            "dtype": "",
            "tags": "",
            "default": ""
        },
        "2": {
            "name": "",
            "desc": "",
            "dtype": "",
            "tags": "",
            "default": ""
        },
        "3": {
            "name": "",
            "desc": "",
            "dtype": "",
            "tags": "",
            "default": ""
        }
    }
    return reg
