"""
  mkswitch_stack.py

  Purpose:
  Generate an include file from the platform dependant
  include files mentioned in slp_platformselect.h .

  The existing slp_switch implementations are calling
  the macros slp_save_state and slp_restore_state.
  Now I want to support real stack switching, that is,
  the stack is not modified in place, but we jump to
  a different stack, without copying anything.
  This costs a lot of memory and should be used for
  a few high-speed tasklets, only.

  In order to keep things simple, I'm not special-casing
  the support macroes, but use a different macro set.
  The machine code is the same, therefore the implementation
  can be generated from the existing include files.

  We generate a new include file called slp_switch_stack.h .
"""

def parse_platformselect():
    fin_name = "slp_platformselect.h"
    fin = file(fin_name)
    fout_name = "slp_switch_stack.h"
    fout = file(fout_name, "w")
    import sys
    print>>fout, "/* this file is generated by mkswitch_stack.py, don't edit */"
    print>>fout
    for line in fin:
        tokens = line.split()
        if not tokens: continue
        tok = tokens[0]
        if tok == "#endif":
            print>>fout, line
            break # done
        if tok in ("#if", "#elif"):
            print>>fout, line
        elif tok == "#include":
            finc_name = tokens[1][1:-1]
            txt = parse_switch(finc_name)
            print>>fout, txt

edits = (
    ("slp_switch", "slp_switch_stack"),
    ("SLP_SAVE_STATE", "SLP_STACK_BEGIN"),
    ("SLP_RESTORE_STATE", "SLP_STACK_END"),
)

def parse_switch(fname):
    f = file(fname)
    res = []
    for line in f:
        if line.strip() == "static int":
            res.append(line)
            break
    for line in f:
        res.append(line)
        if line.rstrip() == "}":
            break
    # end of procedure.
    # now substitute
    s = "".join(res)
    for txt, repl in edits:
        s = s.replace(txt, repl)
    return s

if __name__ == "__main__":
    parse_platformselect()