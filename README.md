# Spring Boot BOM - 1.5 

This Bill Of Materials for Spring Boot 1.5 contains starters which are currently used by the 
[Spring Boot Mission Boosters](https://github.com/snowdrop?q=booster)

The starters have been aligned against Spring Boot Version : 1.5.7.RELEASE

This BOM is aligned to : 

Spring
- Spring Boot 1.5.7.RELEASE

Spring Cloud
- [Dalton SR2](https://spring.io/blog/2017/07/21/spring-cloud-dalston-sr2-is-available-now)
- [Spring Cloud Kubernetes - 0.2.0](https://github.com/spring-cloud-incubator/spring-cloud-kubernetes/tree/v0.2.0.RELEASE)
- Fabric8 Kubernetes/OpenShift Client 2.4.1

Tracing
- OpenTracing 0.30.0

Integration
- Apache CXF Spring Boot Starter 3.1.12 (which corresponds to latest EAP 7.1.0 version)
- Keycloak 3.3.0.CR2 (target for release is 3.4.0)

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

So, right now, as we are targeting Spring Boot version 1.5.7.RELEASE, our BOM GAV will be: 
`me.snowdrop:spring-boot-bom:1.5.7-SNAPSHOT` until released. The released version will be 
`me.snowdrop:spring-boot-bom:1.5.7.Final` and the new version in the 1.5 branch will 
be `me.snowdrop:spring-boot-bom:1.5.7.SP1-SNAPSHOT`.

See [SB-162](https://issues.jboss.org/browse/SB-162) for a discussion of BOM versionning.