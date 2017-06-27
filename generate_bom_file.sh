#!/usr/bin/env bash

PROJECT_DIR=spring-boot-parent
VERSION=${1:-2.11}

rm -rf  target && mkdir target && cd target

if [ -d $PROJECT_DIR ]; then
 echo "## Deleting $PROJECT_DIR directory ...."
 rm -rf $PROJECT_DIR
fi

git clone git@github.com:snowdrop/spring-boot-parent.git && cd $PROJECT_DIR
git push origin --delete release && git branch -d release

curl -O http://central.maven.org/maven2/org/commonjava/maven/ext/pom-manipulation-cli/$VERSION/pom-manipulation-cli-$VERSION.jar

git checkout -b release
java -jar pom-manipulation-cli-$VERSION.jar

git commit -m "Update pom file" pom.xml
git push --set-upstream origin release

cd ~

