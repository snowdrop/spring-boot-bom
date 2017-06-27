#!/usr/bin/env bash

export CURRENT=$(pwd)
PROJECT_DIR=spring-boot-parent
VERSION=${1:-2.11}

if [ -d $PROJECT_DIR ]; then
 echo "## Deleting $PROJECT_DIR directory ...."
 rmdir $PROJECT_DIR
fi

git clone https://github.com/snowdrop/spring-boot-parent.git && cd $PROJECT_DIR
curl -O http://central.maven.org/maven2/org/commonjava/maven/ext/pom-manipulation-cli/$VERSION/pom-manipulation-cli-$VERSION.jar

git checkout -b release
java -jar pom-manipulation-cli-$VERSION.jar
git commit -m "Update pom file" pom.xml
git push
