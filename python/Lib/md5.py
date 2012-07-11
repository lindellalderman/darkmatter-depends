# $Id: md5.py 58586 2007-10-21 16:20:48Z richard.tew $
#
#  Copyright (C) 2005   Gregory P. Smith (greg@krypto.org)
#  Licensed to PSF under a Contributor Agreement.

import warnings
warnings.warn("the md5 module is deprecated; use hashlib instead",
                DeprecationWarning, 2)

from hashlib import md5
new = md5

blocksize = 1        # legacy value (wrong in any useful sense)
digest_size = 16
