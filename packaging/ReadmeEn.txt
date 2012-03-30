********************************************************************
H y d r o g n o m o n    4   -   V e r s i o n  4.1.0.26
   M a r c h   30th,    2 0 1 2
********************************************************************

File: ReadmeEn.txt

CONTENTS 
==========

1. GENERAL
2. INSTALLATION
3. HELP - INFORMATION
4. THINGS TO BE DONE
5. BUG REPORTS - CONTACT INFO
6. CHANGE LOG
  6.1 General changes
  6.2 Recent Changes - bug resolutions



1. GENERAL

Hydrognomon is a software application suitable for the process and
analysis of hydrological time series. Its main functions includes
statistical analysis, regression and infilling of time series,
tests, Intensity Duration Frequency curves, stage-discharge
curves construction and calculations, hydrometry, hydrological
simulation of water basins, evaporation and evapotranspiration
calculations, etc. Software has been developed in several
phases, mainly to serve our group research activities
(http://www.itia.ntua.gr/). Therefore, it contains work
experience of more than ten years from our research projects,
as well as from users of our software. The new version of 
the software (version 4) is freely available. 
In addition, this new version will enable the users 
of the new National Data Bank of Hydrological & Meteorological 
Information of Greece - "Hydroscope" (http://www.hydroscope.gr/) 
to process and analyze its hydrometeorological data.
Hydrognomon is now a part of the openemeteo.org framework
(http://openemeteo.org/).

This is the version 4.1.0, a regular updated version of the 4.x series
of Hydrognomon.

Main hydrognomon site with links for download and more information
is:
  
  http://hydrognomon.org/

Software will inform you automatically for new versions (*). If you
want you may subscribe to our special mailing list for this purpose,
where new versions will be announced together with news and changes.
The link to subscribe is:

  http://www.itia.ntua.gr/cgi-bin/mailman/listinfo/hydrognomon-announce

Due to license restrictions you should download the software
directly from us. You cannot redistribute it 
to your friends, but you may forward the above link so that your 
friends are able to download it from us (see above).

Source code is Delphi (2009) and it is freely available from the
url:

  http://openmeteo.org/code/

From the above web-page you can obtain the source code, search
and report new bugs (you have to create you own account),
or you can involve in the software production process.


The license of the software is GPL (v3) with some exceptions:

  http://en.wikipedia.org/wiki/GPL

For specific terms of use, run the software (without any
restriction) and read the license's terms in the menu
"Help->License" or simply open the file License.txt.
Some license text improvements may be done, without
affecting the terms of use.



2. INSTALLATION

If you have already download the hydrognomon installer
(setup software), then the installation is done automatically.
If you install with the installation program, please remove
any older hydrognomon executable files. Installation
script is very simple and you can have a plot for
the steps it follows if you read the following paragraph.

If you have download the single zip archive, please
follow the steps bellow:
Installation is straightforward since the only thing
you need in order to run the software is the "EXE"
file hydrognomon.exe. You can copy it into a folder
of your choise. You may also copy the reprave.rav and Logo.bmp
files to the location of hydrognomon.exe in order to
have the reporting feature. Logo.bmp is a bitmap file
format with dimensions of 242x109 pixels, whitch can be
altered in order you have your logo printed in your 
reports. License.txt and Readme*.txt files are optional.
In adition in the downloaded zip file you will also
find a folder named "Samples" which contains some files,
for testing purposes (mainly time series files,
a hydrometry file as well as discharge-sediment discharge
curves).
After you have run the software for the first time, you will
be notified for an adjustment that enables the *.hts
files (time series) to be automatically opened together with
the Hydrognomon software.
For any other change of the software directory, (in other folder)
you will be asked whether you want to update the new location
of the software, so that the *.hts files will be opened from
that new location.
You can also download the help file (Hydrognomon4.chm), in
Greek Text. You may copy the file to the same location (folder)
of Hydrognomon.exe. This gives context sensitive help by
pressing the F1 key, or use the menu selection Help->Help.
On some systems, help might not show correctly. The symptoms are:
contents are displayed but not the text. This problem arise from
the security system of Microsoft. To show correctly help, right-click
on the hep file, select properties. If "Read only" is checked then
uncheck. If "Unblock" button is available, press-it.



3. HELP - INFORMATION


The theoritical - scientific documentation of Hydrognomon
is given to the following link:

  http://www.itia.ntua.gr/en/docinfo/928/

User manual:

  http://www.itia.ntua.gr/en/docinfo/934/

Currently, the text is in Greek Language only and We are still
seeking a source to finance an English Language
translation of the documentation and manuals.

You can be helped by the material given to the link that 
follows:

  http://www.itia.ntua.gr/help/misc/hydrognomon/

Videos showing software functions are available to
Hydrognomon own's channel in youtube:

  http://www.youtube.com/hydrognomon

(some older videos can be found to the second page
 above)

Finally a facebook page is available:

  http://www.facebook.com/#/pages/Hydrognomon/326779340275



4. THINGS TO BE DONE

Apart from the bugs resolutions, some things to be done are:

1. Modification of "Zygos" basin simulation model.
2. Alternative "ziped" file format with data compression and
including many time series files in one single file.
3. Grouping for two month, three month, etc. time steps.
4. Some minor fixes in bugs of Undo and Redo.
5. Improvements in disaggregation, etc.



5. BUG REPORTS - CONTACT

In case of a bug, during the use of the software, it would be
very helful to contact with us and report it. Before reporting
a new bug, please check if you already have the latest version.
(check from http://www.itia.ntua.gr/en/softinfo/28/ )

If you wish to report a bug, please describe all the steps
leading to the specific bug. (nothing is obvious).

Bugs are reported to the:
  bugs@hydrognomon.org
e-mail address, or submitted directely to:
  http://openemeteo.org/code/


For administrative issues and general comments concering
the software, please send e-mail to Dr. Nikos Mamassis:
  nikos@itia.ntua.gr

For technical discussion on hydrognomon send e-mail to
Dr. Stefanos Kozanis:
  S.Kozanis@itia.ntua.gr

We would like to inform you that due to work-load, we cannot serve
the following requests directly:
1. Provide full technical support to the users of the software,
such as instruction issues, functional issues, etc.
2. Provide full technical support concering engineering isses,
namely to set the software application for your project.



6. CHANGE LOG

6.1 General Changes

In general, verion compared to version 3 differs to the following:
-New file format and time series data structures to model several
time steps.
-Redesign of user interface, use of floating toolbars, etc.
-Unicode support - multi language application.
-Abatement of database functionality.
-Time series are documents with save/save as... capabilities.
-Hydrometry application.
-Discharge - Sediment discharge curves.
-Multi regression of time series with optimisation capabilities.
-Improvements on statistics, evapotranspiration calculations,
 complex calculations of time series, aggregation, etc.

6.2 Recent Changes - bug resolutions

[4.1.0.26 March 30th, 2012]
-Maximum Likelihood Estimation (MLE) of statistical distributions
 parameters
-Climacograms
-Improvements in Monte Carlo estimation of confidence intervals.
-Other bug fixes and improvements.
A complete list of registered resolutions can be found here:
https://openmeteo.org/code/query?keywords=rel_4_1_0


[4.0.3.25 July 20th, 2010]
-Rose diagrams for winds, etd (Wind roses)
-Bug fixes in time series graphs
-Minor aggregation algorithm improvements
For an auto list with reported and resolved bugs in version
4.0.3.25, please consider:
https://www.openmeteo.org/code/query?component=louise&component=Hydrognomon&component=thelma&order=priority&col=id&col=summary&col=status&col=priority&col=component&col=reporter&col=keywords&keywords=~rel_4_0_3

[4.0.2.24 June 29th, 2010]
-Fixing all memory leak problems.
-Increase of decimal digits in "Pythia". Ouput of non zero values
 percent ("Wet days").
-Fix in an issue of non automatic determination of "Nominal Offset"
 when set "Time step strict" to on manually.
-Minor fixes in graphs and software appearance.
For an auto list with reported and resolved bugs in version
4.0.2.24, please consider:
https://www.openmeteo.org/code/query?component=louise&component=Hydrognomon&component=thelma&order=priority&col=id&col=summary&col=status&col=priority&col=component&col=reporter&col=keywords&keywords=~rel_4_0_2

[4.0.1.22 May 12th, 2010]
-Fix of a major issue observed in some encodings (such as in
 Chinese (PRC)), that denied users to open time series files
 saved in "hydrognomon 4" format.
-When opening time series from shell, splash screen is not shown.
-A default offset is assessed for "regularize step" interface.
-Filtered time series are highlited. User can switch to another
 time series when filtering is on.
-When a modal window is shown, and a time series is requested to
 open from shell, the time series opens after closing all modal
 windows.
-Pythia displays histograms and PDF (probability density functions).
For an auto list with reported and resolved bugs in version
4.0.1.22, please consider:
https://www.openmeteo.org/code/query?component=louise&component=Hydrognomon&component=thelma&order=priority&col=id&col=summary&col=status&col=priority&col=component&col=reporter&col=keywords&keywords=~rel_4_0_1

[4.0.0.20 April 12th, 2010]
-Improvement in time series reduction with Double mass curve.
-Seasonal time steps (monthly, two, three months ... six months)
 when are displayed simultaneously, they appear now in right
 order.
-Some minor fixes in Undo / Redo.
-Aggregation functions: Instantaneous variables and seasonal
 aggregation.
-In time series processes with seasonality, now the actual offset
 is considered.
-Some improvements and fixes in "Regularize Step" algorithm.
-Default encoding when imporing data for time series is now the
 default ANSI code page (such as Windows 1253).

[3.99.13.19 March 22th, 2010]
-Fix in errors in regression with autocorrelation routine.
-Fix in serious problems of Undo and Redo processes including
 system hang in some cases and memory leakages.
-Entire new Aggregation routine and interface. Aggregation now
 is possible to any time step.
-Improvements in display for resolutions greater than 96 dpi
 (such as 120 dpi) and overal improvement in software appearance.
-Improvements in new time series definition.
-Some improvements in time series graphs.

[3.99.12.18 February 17th, 2010]
-User defined time series templates to easy the process of creating
 new time series.
-"Go to" feature to jump in time series records without searching
 with the slide-bar.
-Fixing some erroneous automatic time series records selections.

[3.99.11.17 January 27th, 2010]
-Time step regularization for every possible time step including
 time series with variable time step.
-Fix in data disapearing problem in some instances.
-Improvements in new software updates notification service.

[3.99.10.16 December 30th, 2009]
-Hydrological (Water) Year is fully customizable. First month
 can be specified, for annual time series, calendar tables, etc.
-Negative precision in time series data round values to the left
 of the decimal separator.
-Fix in some problems  that came by some actual offset settings.
-Some minor improvements in date display.
-User friendly method to insert new records.

[3.99.9.15 December 22th, 2009]
-New file format. Keeping compatibility with older file formats.
 When opening file, the file format is probed automatically.
 When saving, user select the desired file format. New file format
 is unicode.
-New modeling of time steps. Included are: 15 minute, 20 minute,
 half hour, 2,3,4,6,8,12 hour, 2,3,4,6 month, 2,5,10 year time
 steps. Custom time steps. User defined origin for hydrological
 years.
-New user interface for time series properties - new time series.
-Time zone property in hydrognomon settings / time series properties.

[3.99.8.14 December 7th, 2009]
-Fix on denying opening files opened from other software.
-Minor fixes of Undo.
-Changing time step coding.

[3.99.7.13 November 26th, 2009]
-When importing data from text files, it is possible to import
 from a third column flag data.
-Improved appearance of "Pythia" (statistics). Display of negative
 values, zoom & pan features, information for points of empirical
 distribution (such as date, value).
-More functions for the complex calculations function: nrnd() for
 normal distribution random values with stdev specified, round(),
 int() and trunc() for truncating negative values to zero.
-Some fixes in "Ombros" and regression module.

[3.99.6.12 November 17th, 2009]
-User may set any number of flags beyond of system default flags on
 time series records. Can open time series files with any flags
 set. Improved flag and filtering interface.
-Several bug fixes on errors when loading default settings from
 windows registry, statistical processes on time series, multilingual
 interface problems.
-Bug fixes when importing data from text files with several encodings.

[3.99.5.10 November 9th, 2010]
Intermediate version with minor fixes

[3.99.5.9 November 6th, 2009]
-Special tool for importing data from plain text files to hydrognomon
 time series. Reads from files with several formats and its 
 configurable to select delimiter symbols, columns, date formats, etc.
-Improvements and fixes in statistical process tool. Resolution of
 numerical errors in Monte Carlo simulation.
-Edit-Paste fixes.
-Complex Calculations fixes.
-Auto update service. User is informed for new hydrognomon versions.

[3.99.4.8 October 29th, 2009]
-Windows help (in Greek)
-Improvement in Monte-Carlo simulation Monitoring. Smoother
 operation, display of estimated time for completion, easy
 simulation stop by user interaction.
-Statistical functions points can be copied to clipboard.

[3.99.3.6 October 12th, 2009]
-Some improvements on optimisation function in multi
 regression, improvements on deviation chart.
-Bug resolution in table - chart viewing of time series.

[3.99.2.5 October 1st, 2009]
-Consistent output of time series with null values when
 many time series are used as input data.
-Some fixes in IDF curves.
-Spatial integration of rainfall - altitude reduction.

[3.99.1.5 September 24th, 2009]
-Hydrognomon associates the *.hts files.

[3.99.1.3 September 21th, 2009]
-Fixes in bugs when opening files.
-Command line opening of files, drag and drop of files.
-Some fixes in date format in curves files.



Acknws. Mrs Stefania Polydorou for the English Translation



(*) Automatic notifications for new version is done by retrieving
the http://update.hydrognomon.org/updated_version file every time
software starts. File has on line of the form bellow:

4.0.1.22,http://update.hydrognomon.org/updated_version,http://hydrognomon.org/download.html

It contains the current version number, the update and the 
download site. During new version checking no personal information
is transfered.  Automatic notification is a very useful feature,
but you can if you want deactivate it by adjusting software Options.

You may also check manually for new version with the appropriate
menu selection.
