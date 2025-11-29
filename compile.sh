
# compile.sh
#
# MIT License
#
# Copyright (C) 2025 Stefanos "Steven" Tsakiris
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

#!/bin/bash

NAME="compile.sh";
true=1;
false=0;

function main(){
	[ $true        ] && { local systems="";                                                                                                                                                    } || :;
	[ $true        ] && { local utilities="";                                                                                                                                                  } || :;
	[ $true        ] && { local functions="";                                                                                                                                                  } || :;
	[ $true        ] && { local folder="/tmp/microtk";                                                                                                                                         } || :;
	[ $true        ] && { local libraries="-lxcb -lxcb-composite -lxcb-damage -lxcb-randr -lxcb-render -lxcb-shape -lxcb-xfixes -lxcb-xinput -lxcb-xkb -lxcb-xtest -lX11 -lX11-xcb";           } || :;
	[ $true        ] && { cd $(dirname $0);                                                                                                                                                    } || :;
	[ ! -f "$NAME" ] && { cd $(cd $(dirname $BASH_SOURCE) && pwd);                                                                                                                             } || :;
	[ ! -f "$NAME" ] && { printf "$NAME: could not find $NAME directory\n" 1>&2;                                                                                                     return 1; } || :;
	[ $true        ] && { systems=$(cat ./systems.csv);                                                                                                                                        } || :;
	[ $true        ] && { utilities=$(cat ./utilities.csv);                                                                                                                                    } || :;
	[ $true        ] && { functions=$(cat ./functions.csv);                                                                                                                                    } || :;
	[ $true        ] && { ./compile/compile.sh header-folder "headers" source-folder "source" debug-folder "$folder/debug" output-folder "$folder/output" record-folder "$folder/record" systems "$systems" utilities "$utilities" functions "$functions" mains "main" executables "modular-de" libraries "$libraries" "$@"; } || :;
	[ $true        ] && {                                                                                                                                                            return 0; } || :;
}

main "$@";
exit $?;

