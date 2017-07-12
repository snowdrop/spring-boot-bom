# Introduction

This github repo contains the different Spring Boot BOMs maintained along the Spring Boot starters for the different Spring Boot Missions, ...
A branch exists for each version of Spring Boot currently supported; 1.4.x, 1.5.x, 2.x ...

To modify a pom, checkout the appropriate branch `git checkout sb-1.4.x`

# Releasing

Issue first a dry run to control the changes

```bash
mvn release:prepare -DdryRun
```

Convention to follow :

```bash
What is the release version for "spring-boot-1.4-bom"? \
  (org.jboss.snowdrop:spring-boot-1.4-bom) 1: : <DIGIT>
What is SCM release tag or label for "spring-boot-1.4-bom"? \
  (org.jboss.snowdrop:spring-boot-1.4-bom) spring-boot-1.4-bom-1: : sb-1.4-<DIGIT>
What is the new development version for "spring-boot-1.4-bom"? \
  (org.jboss.snowdrop:spring-boot-1.4-bom) 2-SNAPSHOT: : <NEXT-DIGIT>

where <DIGIT> corresponds to the number without `-SNAPSHOT` and `<NEXT-DIGIT>` is the next digit available
```

Before to release, check within your `~/.m2/settings.xml` file that you have a `<service><id>` for `jboss-releases-rpository` defined which contains your 
credentials

```bash
<server>
  <id>jboss-releases-repository</id>
  <username>userName</username>
  <password>passWord</password>
```

Then release

```bash
mvn release:perform
```

