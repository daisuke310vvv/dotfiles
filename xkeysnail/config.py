# -*- coding: utf-8 -*-

import re
from xkeysnail.transform import *

define_keymap(None, {
    K('Alt-h'): Key.LEFT,
    K('Alt-j'): Key.DOWN,
    K('Alt-k'): Key.UP,
    K('Alt-l'): Key.RIGHT,
}, "Vim-like cursor")

define_keymap(None, {
    K('esc'): [K('muhenkan'), K('esc')]
}, "Esc and IME off")
