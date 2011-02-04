@ECHO OFF

:Loop
IF "%1"=="clean" GOTO clean
IF "%1"=="build" GOTO build

:build
(
  echo Building Lector...
  pyuic4 ui/ui_lector.ui > ui/ui_lector.py
  pyuic4 ui/ui_settings.ui > ui/ui_settings.py
  pyuic4 ui/ui_scanner.ui > ui/ui_scanner.py
  pylupdate4 lector.pro
  lrelease lector.pro
  pyrcc4 -o ui/resources_rc.py ui/resources.qrc
  GOTO end
  REM EXIT /B 0
)

:clean
  rm -f ui/ui_*.py ui/resources*.py ts/*.qm ts/lector_*.qm *.pyc ui_*.py resources*.py

:end
  echo Done!
REM DOC
REM http://www.robvanderwoude.com/parameters.php
REM http://ss64.com/nt/syntax-args.html
REM http://skypher.com/index.php/2010/08/17/batch-command-line-arguments/
