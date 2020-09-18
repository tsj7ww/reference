import logging
import io
import sys

def LOGGER(handler=None,format=None,level=None):
    """"""
    l = logging.getLogger(__name__)

    if not format:
        f = '%(asctime)s - %(name)s - %(levelname)s - %(message)s'
        format = logging.Formatter(f)
    if not handler:
        feed = io.String()
        handler = logging.StreamHandler(feed)
    if not level:
        level = logging.DEBUG

    handler.setFormatter(format)
    handler.setLevel(lvl)
    l.addHandler(handler)
    l.setLevel(lvl)

    return l,feed


def LOGGER(env):
    """"""
    f = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s')
    l = logging.getLogger(__name__)

    if env=='dev':
        lvl = logging.DEBUG
        s = None
        h = logging.StreamHandler(sys.stdout)
    elif env=='qa':
        lvl = logging.WARNING
        s = io.StringIO()
        h = logging.StreamHandler(s)
    elif env=='prod':
        lvl = logging.ERROR
        s = io.StringIO()
        h = logging.StreamHandler(s)
    else:
        raise Exception('Unknown environment.')

    h.setFormatter(f)
    h.setLevel(lvl)
    l.addHandler(h)
    l.setLevel(lvl)
