import logging
import io

def LOGGER(env):
    """"""
    if env=='dev':
        _lvl = logging.DEBUG
    elif env=='qa':
        _lvl = logging.WARNING
    elif env=='prod':
        _lvl = logging.ERROR
    else:
        raise Exception('Unknown environment.')

    _str = io.StringIO()
    _fmt = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s')
    _handler = logging.StreamHandler(_str)
    _log = logging.getLogger()

    _log.setLevel(_lvl)
    _handler.setFormatter(_fmt)
    _handler.setLevel(_lvl)
    _log.addHandler(_handler)

    return _log,_str
