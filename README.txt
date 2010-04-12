H Y D R O G N O M O N    v. 4

Readme date: 2010-02-09
file version: 0.01

This file contains the required steps to compile
hydrognomon from source files.



I. Check Dependencies and versions.

CodeGear Delphi 2009, version:
  12.0.3420.21218
with TeeChart Standard, version:
  8.03.11068

and

Rave Reports, version:
  7.6.2 (VCL12)

All components are bundled with Delphi 2009, should
be updated to match the above versions.



II. Build Instructions:

1. Check out thelma and louise libraries (version 3).
Check library revisions required by the hydrognomon
version.
Build / Install libraries in this order:

  a. Thelma runtime (thelma3.bpl)
  b. Thelma designtime (thelam3dsgn.bpl)
  c. Louise runtime (louise3.bpl)
  d. Louise designtime (louise3dsgn.bpl)


2. Set the Library Path to Delphi options:
Go to Tools -> Options, then Environment Options,
Delphi Options, Library - Win 32.

Add libraries (thelma and louise) dcu location into
"Library path". Also add *.dcu location:
such as:

C:\thelma\lib;C:\thelma\source;C:\louise\lib;C:\thelma\source

Assuming all dcu's are into "lib" paths and dfm's into
"source" paths.

Also add "source" directories into "Browsing path" setting.


3. Build "CreateBuildDateFile" and "updatelicense" projects.
These can be found as subdirectories under the "hydrognomon"
structure. Copy the resulting exe's (license_update.exe and
CreateBuildDateFile.exe) into hydrognomon's source directory.


4. Manual run the exe's of step 3 into the source directory
in order to create build_date.pas and frmlicen.dfm files
respectively.


5. Open hydrognomon.proj and build

URL's
http://www.hydrognomon.org/
http://www.itia.ntua.gr/

Contact people:

Stefanos Kozanis
S.Kozanis@itia.ntua.gr
Antonis Christofides
anthony@itia.ntua.gr
