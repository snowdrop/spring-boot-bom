# Spring Boot BOM - 1.5 

This Bill Of Materials for Spring Boot 1.5 contains starters which are currently used by the 
[Spring Boot Mission Boosters](https://github.com/snowdrop?q=booster)

The starters have been aligned against Spring Boot Version : 1.5.8.RELEASE

This BOM is aligned to : 

Spring
- Spring Boot 1.5.10.RELEASE

Spring Cloud
- [Edgware.SR1](https://github.com/spring-projects/spring-cloud/wiki/Spring-Cloud-Edgware-Release-Notes#edgwaresr1)
- [Spring Cloud Kubernetes - 0.2.0](https://github.com/spring-cloud-incubator/spring-cloud-kubernetes/tree/v0.2.0.RELEASE)
- Fabric8 Kubernetes/OpenShift Client 2.4.1

Tracing
- OpenTracing 0.31.0

Integration
- [Apache CXF Spring Boot Starter 3.1.12](http://cxf.apache.org/docs/springboot.html) (which corresponds to latest EAP 7.1.0 version)
- Keycloak 3.4.3.Final (which corresponds to latest RH SSO 7.2 version)

ORM
- Hibernate 5.2.11.Final

## Versionning scheme

This BOM is using the following versionning scheme:

`me.snowdrop:spring-boot-bom:<targeted spring boot release version>.<qualifier>[1-9]`

Qualifiers will be, in chronological order:
 - `Alpha` (first semi-stable releases),
 - `Beta` (no more API changes, bugs might still occur),
 - `CR` (Candidate Release, release quality but minor bugs or known postponed issues are possible),
 - `Final` (release version),
 - `SP` (Service Patch, post-release version for fixes needed after a release).

Qualifiers are numbered and we should try to limit their number to 9 but we should still be able to handle more than 10 versions for a given qualifier.

Until a version is released, the BOM version will be `<target spring boot version>-SNAPSHOT`. Once it's released, we will switch to `<target spring boot version>.SP<current SP version + 1>-SNAPSHOT`.

So, right now, as we are targeting Spring Boot version 1.5.8.RELEASE, our BOM GAV will be: 
`me.snowdrop:spring-boot-bom:1.5.8-SNAPSHOT` until released. The released version will be 
`me.snowdrop:spring-boot-bom:1.5.8.Final` and the new version in the 1.5 branch will 
be `me.snowdrop:spring-boot-bom:1.5.8.SP1-SNAPSHOT`.

See [SB-162](https://issues.jboss.org/browse/SB-162) for a discussion of BOM versionning.

## Releasing

The artifacts are released on [Sonatype Open Source Software Repository Hosting (OSSRH)](http://central.sonatype.org/), which is
then synchronized to Maven Central. To perform a release, you need to activate the `release` profile.

0. Make sure that your computer is properly set up as explained in http://central.sonatype.org/pages/apache-maven.html. In 
particular, this implies having a Sonatype JIRA account, added the appropriate configuration in your Maven `settings.xml` and 
having GPG set up on your computer.
0. Check this README for outdated information, notably dependency versions.
1. Prepare the release: `mvn release:prepare -Prelease` on a "clean" repository (i.e. everything is committed and pushed). Note 
that the project version in the POM file needs to end in `-SNAPSHOT` to be recognized as needing release.
    - The release plugin will ask you several questions based on the current project version. Let's assume we're trying to 
    release the `1.5.8.Beta2` of the BOM. The current project version should be `1.5.8-SNAPSHOT` if the version conventions 
    (above) have been properly followed. Based on this, the release plugin will offer to release version `1.5.8` of the BOM.
    - Override this version by type `1.5.8.Beta2`
    - Override the tag name to use the same version: `1.5.8.Beta2` instead of the default suggestion
    - Override the suggested next release version as appropriate, in this case, since we're haven't released a final version of
    the 1.5.8 BOM, the next version still needs to be `1.5.8-SNAPSHOT`.
2. Once this prepare step is done, check that everything is as expected and then release: `mvn release:perform -Prelease`.
3. If everything went well, the new artifact should be available on Maven Central after a couple of minutes.

Note that the Sonatype release plugin is configured to auto-release the artifacts from staging, resulting in a faster, more 
automated release process. This is not mandatory and can be changed in the plugin configuration.