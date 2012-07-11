import os

__revision__ = "$Id: debug.py 82110 2010-06-20 13:38:51Z kristjan.jonsson $"

# If DISTUTILS_DEBUG is anything other than the empty string, we run in
# debug mode.
DEBUG = os.environ.get('DISTUTILS_DEBUG')
