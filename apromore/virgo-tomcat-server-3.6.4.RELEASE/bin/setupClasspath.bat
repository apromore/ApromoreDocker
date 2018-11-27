@echo off
rem Check JAVA_HOME and KERNEL_HOME variables
if "%JAVA_HOME%" == "" (
  echo The JAVA_HOME environment variable is not defined.
  exit /B 1
)
if "%KERNEL_HOME%" == "" (
  echo The KERNEL_HOME environment variable is not defined.
  exit /B 1
)

rem Construct the CLASSPATH list from the Kernel lib directory.
for %%G in ("%KERNEL_HOME%\lib\*.jar") do call :AppendToClasspath "%%G"
for %%G in ("%KERNEL_HOME%\plugins\org.eclipse.osgi_*.jar") do call :AppendToClasspath "%%G"
for %%G in ("%KERNEL_HOME%\plugins\org.eclipse.equinox.console.ssh_*.jar") do call :AppendToClasspath "%%G"

rem Check if there are JAR files in the lib directory.
if "%CLASSPATH%" == "" (
  echo No JAR files found in %KERNEL_HOME%\lib
  exit /B 1
)

rem Remove leading semi-colon if present
if "%CLASSPATH:~0,1%"==";" set CLASSPATH=%CLASSPATH:~1%
if "%FWCLASSPATH:~0,1%"=="," set FWCLASSPATH=%FWCLASSPATH:~1%
exit /B 0

:AppendToClasspath
  set CLASSPATH=%CLASSPATH%;%~1
  set FWCLASSPATH=%FWCLASSPATH%,file:///%~1
  goto :eof
