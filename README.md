# Instructions

Command to be used to replace the version number of the Apache Tomcat Embed and Hibernate Validator jar

```
curl -O http://central.maven.org/maven2/org/commonjava/maven/ext/pom-manipulation-cli/2.11/pom-manipulation-cli-2.11.jar
java -jar pom-manipulation-cli-2.11.jar 
```

The params to be used are defined within the `pme.yml` file. First, we will skip to add within the pom.xml file
some maven plugins and next pass the param [responsible](https://release-engineering.github.io/pom-manipulation-ext/guide/dep-manip.html) to find/replace the GAVs

```
pme:
  project.src.skip: true
  project.meta.skip: true
  dependencyExclusion.org.hibernate:hibernate-validator@*: 5.2.4.Final-redhat-1
  # Update version of all the Embedded Tomcat jars
  dependencyExclusion.org.apache.tomcat.embed:*@*: 8.0.36.redhat-14
```

# Bash script

If you have admin rights on this Github project, you can  generate the BOM file and commit under the result under the branch `release` using the bash script

```bash
./generate_bom_file.sh
```