# Scenario B — Disk Usage Threshold

## 1. Objective

To test the disk usage monitoring script, verify normal and warning conditions, and restore the original 80% threshold.

## 2. Symptom

The disk monitoring script generated a warning when disk usage exceeded the temporary test threshold.

## 3. Evidence — Actual Disk Usage

**Command:**

```bash
df -h /
```

**Actual output:**

```text
Filesystem      Size  Used Avail Use% Mounted on
/dev/root       8.7G  4.1G  4.6G  47% /
```

**Normal health check:**

```bash
./week-05/bash/disk-usage-check.sh
```

**Actual output:**

```text
Disk usage is normal
```

## 4. Root Cause — Controlled Threshold Test

Actual disk usage was 47%, below the configured 80% warning threshold.

To safely test the warning condition without filling the disk, the threshold was temporarily changed from 80% to 40%.

Since 47% is greater than 40%, the warning condition was triggered.

**Temporary test output:**

```text
WARNING: Disk usage is above 80%
```

Note: The warning text is hardcoded in the script. The test threshold was temporarily 40%, so the output message does not represent the actual disk usage threshold during this simulation.

## 5. Fix

Restored the original threshold from 40% to 80%.

**Verification command:**

```bash
grep 'if ' week-05/bash/disk-usage-check.sh
```

**Actual output:**

```text
if [ "$disk_usage" -gt 80 ]
```

No disk files were deleted, and no artificial disk load was generated.

## 6. Verification — Normal Condition Restored

**Command:**

```bash
./week-05/bash/disk-usage-check.sh
```

**Actual output:**

```text
Disk usage is normal
```

The script returned to normal operation with the original 80% threshold.

## 7. Conclusion

The controlled threshold test successfully demonstrated both normal and warning branches of the disk usage monitoring script. The original 80% threshold was restored and verified. The VM's actual root filesystem usage remained at 47%.
