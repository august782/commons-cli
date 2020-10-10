#!/bin/bash

GROUP_ID="org.pitest"
ARTIFACT_ID="pitest-maven"
ARTIFACT_VERSION="1.5.2"

if [[ $1 == "" ]]; then
    echo "arg1 - the path to the project, where high-level pom.xml is"
    exit
fi

crnt=`pwd`
working_dir=`dirname $0`
project_path=$1

cd ${project_path}
project_path=`pwd`
cd - > /dev/null

cd ${working_dir}

javac PomFile.java
find ${project_path} -name pom.xml | grep -v "src/" | java PomFile ${GROUP_ID} ${ARTIFACT_ID} ${ARTIFACT_VERSION}
rm -f PomFile.class

cd ${crnt}
