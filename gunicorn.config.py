import os

bind = ['0.0.0.0:8000']

# Debugging
debug = os.getenv('APP_ENV') != 'prod'
if debug:
    reload = True
    log_level = 'debug'
