#!/usr/bin/env bash
##############################################################################
#
# Gradle wrapper script for Unix
#
#
# To customize Gradle execute properties edit the gradlew.properties file.
#
# To learn more details visit https://docs.gradle.org/8.5/userguide/gradle_wrapper.html
#
##############################################################################

DIR=$(cd "$(dirname "$0")"; pwd)
APP_BASE_NAME=$(basename "$0")

# Add default JVM options here. You can also use JAVA_OPTS and GRADLE_OPTS to pass JVM options to this script.
DEFAULT_JVM_OPTS=""

# Use the supplied Gradle installation, if available.
if [ -n "$GRADLE_HOME" ]; then
    GRADLE_HOME=$(cd "$GRADLE_HOME"; pwd)
fi

# For some reason we need to set JAVA_HOME explicitly, otherwise it fails under Cygwin
if [ -z "$JAVA_HOME" ]; then
  if [ -n "$JDK_HOME" ]; then
    JAVA_HOME="$JDK_HOME"
  else
    JAVA_HOME=$(/usr/libexec/java_home 2>/dev/null)
  fi
fi

export JAVA_HOME

# Determine the Java command to use to start the Gradle daemon.
if [ -n "$JAVA_HOME" ]; then
    if [ -x "$JAVA_HOME/bin/java" ]; then
        JAVA="$JAVA_HOME/bin/java"
    else
        JAVA=""
    fi
else
    JAVA=$(command -v java)
fi

if [ -z "$JAVA" ]; then
    echo >&2 "ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH."
    echo >&2 "Please set the JAVA_HOME variable in your environment to match the"
    echo >&2 "location of your Java installation."
    exit 1
fi

# An internal function to ensure that any provided argument is prefixed with double quotes.
# This is required due to the way the arguments are processed in the startGradle function.
quoteArg() {
    if [[ "$1" == "" ]]; then
        echo "\"\""
    else
        echo "\"$1\""
    fi
}

# An internal function to start Gradle.
startGradle() {
    # Add all JVM options to the command line.
    all_jvm_opts="$DEFAULT_JVM_OPTS $JAVA_OPTS $GRADLE_OPTS"

    # We must quote each argument to avoid any problems with spaces in arguments.
    # Use printf to properly quote each argument.
    quoted_args=()
    while IFS= read -r -d $'\0' arg; do
        quoted_args+=("$(quoteArg "$arg")")
    done < <(printf "%s\0" $all_jvm_opts)

    # Execute Gradle with the arguments.
    exec "$JAVA" "${quoted_args[@]}" \
        "-classpath" "$(echo "$CLASSPATH" | tr ':' "$CLASSPATH_SEPARATOR")" \
        org.gradle.wrapper.GradleWrapperMain "$@"
}

# Find the best Classpath separator for the current system.
if [[ "$OSTYPE" == "cygwin" || "$OSTYPE" == "msys" ]]; then
  CLASSPATH_SEPARATOR=';'
else
  CLASSPATH_SEPARATOR=':'
fi

# Collect arguments to be passed to Gradle.
ARGS=()
while [ $# -gt 0 ]; do
    ARGS+=("$1")
    shift
done

# Determine the classpath for the Gradle distribution.
CLASSPATH="$DIR/gradle-wrapper.jar"

# Start Gradle.
startGradle "${ARGS[@]}"