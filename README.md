# fpcamigachk
FreePascal Amiga structure check using H2PasChk

checks the FreePascal library units Pascal-records against the SDK C-structs (Position/Size of every field and the overall size of the struct)

you need for your Amiga-System:
- H2PasChk can be found in the util/h2pas directory of FreePascal
- FreePascal
- gcc with working binutils (make, ls, diff, rm)

to start the tests just run <code>make</code>.

to start a single test run <code>make execchk.diff</code> (name of a .chk File with the extension replaced with diff)

errors can be found in the resulting diff files, if everything goes well there are should be empty.

it is tested to work on AROS and MorphOS. should work on OS4 as well (untested).
On OS3 still some problems because the gcc is so old that the c source does not
compile if there is an additional point in the structure (vbcc seems to have the same problem)
