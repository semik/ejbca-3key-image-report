# Vulnerabities report for EJBCA-3KEY image

Vulnerabity report for EJBCA-3KEY image. Production grade image does have tag `9.2.0-1.0.5-nshield-12.81.2` other images are experimental version for further discusion.

Each section bellow contains links to full details of reports produced by trivy in text and json formats. json format cointains complete paths for problematic components.

1. By running `apt update && apt upgrade` during buildtime is possible to reduce number of vulnerabites:
    ```
    Total: 56 (UNKNOWN: 0, LOW: 30, MEDIUM: 26, HIGH: 0, CRITICAL: 0) - ubuntu 24.04
    Total: 49 (UNKNOWN: 0, LOW: 30, MEDIUM: 19, HIGH: 0, CRITICAL: 0) - ubuntu 24.04 - apt update && apt upgrade in buildtime
    ```
    the numbers will vary each day as some CVE will get fixed in the future and new will be discovered.

2. By upgrading to WildFly 35 vulnerabities in Java can be reduced. Version 35 is last supported by EJBCA.
   ```
   Total: 23 (UNKNOWN: 0, LOW:  0, MEDIUM: 11, HIGH: 12, CRITICAL: 0) - Java (jar) - EJBCA + WildFly 33
   Total: 13 (UNKNOWN: 0, LOW:  0, MEDIUM:  5, HIGH:  8, CRITICAL: 0) - Java (jar) - EJBCA + WildFly 35
   ```

3. By upgrading to SecurityWorld 13.6.5 some vulnerabities can be mitigated and new introduced
   ```
   Total: 23 (UNKNOWN: 0, LOW:  0, MEDIUM:  9, HIGH: 13, CRITICAL: 1) - Python (python-pkg) - SecurityWorld 12.81.2
   Total: 84 (UNKNOWN: 0, LOW:  1, MEDIUM: 31, HIGH: 47, CRITICAL: 5) - opt/nfast/bin/ncssh (gobinary) - SecurityWorld 12.81.2
   ... vs ...
   Total:  1 (UNKNOWN: 0, LOW:  1, MEDIUM:  0, HIGH:  0, CRITICAL: 0) - Python (python-pkg) - SecurityWorld 13.6.5
   Total:  7 (UNKNOWN: 0, LOW:  0, MEDIUM:  5, HIGH:  1, CRITICAL: 1) - opt/nfast/bin/ncssh (gobinary) - SecurityWorld 13.6.5
   ```
4. Critical vulnerabity in file `opt/nfast/bin/ncssh` can be resolved by deleting it. It is needed for [HardServer](https://nshielddocs.entrust.com/security-world-docs/v13.6.5/utilities/ncssh.html) and EJBCA it should be irelevant. But not that after upgrade `nshield-hwsp` this problem will arise again.
5. I've no clue why Entrust did put some SSH keys into SecurityWorld 13.6.5

## harbor.3key.company/ejbca-3key/ejbca-3key:9.2.0-1.0.5-nshield-12.81.2
```
Total: 56 (UNKNOWN: 0, LOW: 30, MEDIUM: 26, HIGH:  0, CRITICAL: 0) - ubuntu 24.04
Total: 23 (UNKNOWN: 0, LOW:  0, MEDIUM: 11, HIGH: 12, CRITICAL: 0) - Java (jar) - EJBCA + WildFly 33
Total: 23 (UNKNOWN: 0, LOW:  0, MEDIUM:  9, HIGH: 13, CRITICAL: 1) - Python (python-pkg) - SecurityWorld 12.81.2
Total: 84 (UNKNOWN: 0, LOW:  1, MEDIUM: 31, HIGH: 47, CRITICAL: 5) - opt/nfast/bin/ncssh (gobinary) - SecurityWorld 12.81.2
```
Complete report: [txt](reports/9.2.0-1.0.5-nshield-12.81.2.txt), [json](reports/9.2.0-1.0.5-nshield-12.81.2.json)

## harbor.3key.company/ejbca-3key/ejbca-3key:ejbca-9.2.0-wildfly-35.0.0-semik4-13.6.5
```
Total: 49 (UNKNOWN: 0, LOW: 30, MEDIUM: 19, HIGH: 0, CRITICAL: 0) - ubuntu 24.04 - apt update && apt upgrade in buildtime
Total: 13 (UNKNOWN: 0, LOW:  0, MEDIUM:  5, HIGH: 8, CRITICAL: 0) - Java (jar) - EJBCA + WildFly 35
Total:  1 (UNKNOWN: 0, LOW:  1, MEDIUM:  0, HIGH: 0, CRITICAL: 0) - Python (python-pkg) - SecurityWorld 13.6.5
Total:  7 (UNKNOWN: 0, LOW:  0, MEDIUM:  5, HIGH: 1, CRITICAL: 1) - opt/nfast/bin/ncssh (gobinary) - SecurityWorld 13.6.5
Total:  1 (UNKNOWN: 0, LOW:  0, MEDIUM:  0, HIGH: 1, CRITICAL: 0) - /opt/nfast/.../nshield/hsmadmin/default_keys/sshadmin_id_ecdsa  - SecurityWorld 13.6.5(secrets)
Total:  1 (UNKNOWN: 0, LOW:  0, MEDIUM:  0, HIGH: 1, CRITICAL: 0) - /opt/nfast/.../sshadmin_id_ecdsa (secrets) - SecurityWorld 13.6.5
```
Complete report: [txt](reports/ejbca-9.2.0-wildfly-35.0.0-semik4-13.6.5.txt), [json](reports/ejbca-9.2.0-wildfly-35.0.0-semik4-13.6.5.json)

## harbor.3key.company/ejbca-3key/ejbca-3key:ejbca-9.2.0-wildfly-35.0.0-semik4-13.6.5-HOTFIX
```
Total: 49 (UNKNOWN: 0, LOW: 30, MEDIUM: 19, HIGH: 0, CRITICAL: 0) - ubuntu 24.04 - apt update && apt upgrade in buildtime
Total: 13 (UNKNOWN: 0, LOW:  0, MEDIUM:  5, HIGH: 8, CRITICAL: 0) - Java (jar) - EJBCA + WildFly 35
Total:  1 (UNKNOWN: 0, LOW:  1, MEDIUM:  0, HIGH: 0, CRITICAL: 0) - Python (python-pkg)  - SecurityWorld 13.6.5
Total:  1 (UNKNOWN: 0, LOW:  0, MEDIUM:  0, HIGH: 1, CRITICAL: 0) - /opt/nfast/.../nshield/hsmadmin/default_keys/sshadmin_id_ecdsa (secrets) - SecurityWorld 13.6.5
Total:  1 (UNKNOWN: 0, LOW:  0, MEDIUM:  0, HIGH: 1, CRITICAL: 0) - /opt/nfast/.../sshadmin_id_ecdsa (secrets) - SecurityWorld 13.6.5
```
Complete report: [txt](reports/ejbca-9.2.0-wildfly-35.0.0-semik4-13.6.5-HOTFIX.txt), [json](reports/ejbca-9.2.0-wildfly-35.0.0-semik4-13.6.5-HOTFIX.json)
