@rem
@rem Gradle wrapper script for Windows
@rem
@rem To customize Gradle execute properties edit the gradlew.properties file.
@rem
@rem To learn more details visit https://docs.gradle.org/8.5/userguide/gradle_wrapper.html
@rem

@echo off

setlocal

@rem Find the best location for JAVA_HOME, if not set.
if not defined JAVA_HOME goto findJavaHome

:alreadySet
if exist "%JAVA_HOME%\bin\java.exe" goto execute

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
goto fail

:findJavaHome
echo Looking for Java in the environment...
for %%i in ("%JAVA_HOME%" "C:\Program Files\Java\jdk" "C:\Program Files\Java\jre") do (
    if exist "%%i\bin\java.exe" (
        echo Using Java found at: %%i
        set "JAVA_HOME=%%i"
        goto execute
    )
)
echo.
echo ERROR: JAVA_HOME is not set and no Java could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:execute
@rem Set command line arguments for the JVM as needed.
set DEFAULT_JVM_OPTS=

@rem Execute Gradle.
"%JAVA_HOME%\bin\java" %DEFAULT_JVM_OPTS% "-classpath" "%~dp0\gradle-wrapper.jar" org.gradle.wrapper.GradleWrapperMain %*
goto end

:fail
rem End script with non-zero exit code.
exit /b 1

:end
endlocal