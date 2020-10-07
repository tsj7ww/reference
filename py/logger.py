import logging
import io
import sys

def LOGGER(handler=None,format=None,level=None):
    """"""
    logger = logging.getLogger(__name__)

    if not format:
        fmt = '%(asctime)s - %(name)s - %(levelname)s - %(message)s'
        formatter = logging.Formatter(fmt)
    if not handler:
        feed = io.String()
        handler = logging.StreamHandler(feed)
    if not level:
        level = logging.DEBUG

    handler.setFormatter(formatter)
    handler.setLevel(level)
    logger.addHandler(handler)
    logger.setLevel(level)

    return logger,feed


def LOGGER(env):
    """"""
    fmt = '%(asctime)s - %(name)s - %(levelname)s - %(message)s'
    formatter = logging.Formatter(fmt)
    logger = logging.getLogger(__name__)

    if env=='dev':
        level = logging.DEBUG
        feed = sys.stdout
    elif env=='qa':
        level = logging.INFO
        feed = io.StringIO()
    elif env=='prod':
        level = logging.WARNING
        feed = io.StringIO()
    else:
        raise Exception('Unknown environment.')

    handler = logging.StreamHandler(feed)
    handler.setFormatter(formatter)
    handler.setLevel(level)
    logger.addHandler(handler)
    logger.setLevel(level)

    return logger,feed
