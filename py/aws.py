import os
import io
import json
import boto3

def BUCKET():
    """"""
    _cfg = {

    }

    return boto3.client('s3', region_name=_cfg['region'])

def S3():
    """"""
    _cfg = {

    }

    return boto3.client('s3', region_name=_cfg['region'])

def IAM():
    """"""
    _cfg = {

    }

    return boto3.client('iam')

def LAMBDA():
    """"""
    _cfg = {

    }

    return boto3.client('lambda', region_name=_cfg['region'])
