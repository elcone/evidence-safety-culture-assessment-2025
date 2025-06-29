# Safety Culture Assessment 2025

## Distribution by Role

```sql distribution_by_role
SELECT "Role" AS Role, count(*) AS Count
FROM blast_warehouse.safety_culture_assessment_2025
GROUP BY "Role"
```

<BarChart
  data={distribution_by_role}
  x="Role"
  y="Count"
/>

## Distribution by Years with the Agency

```sql distribution_by_years
SELECT "Years with the agency" AS "Years with the agency", count(*) AS Count
FROM blast_warehouse.safety_culture_assessment_2025
GROUP BY "Years with the agency"
```

<BarChart
  data={distribution_by_years}
  x="Years with the agency"
  y="Count"
/>

## Distribution by Primary work setting

```sql distribution_by_work_setting
SELECT "Primary work setting" AS "Primary work setting", count(*) AS Count
FROM blast_warehouse.safety_culture_assessment_2025
GROUP BY "Primary work setting"
```

<BarChart
  data={distribution_by_work_setting}
  x="Primary work setting"
  y="Count"
/>

## Average score by question

```sql overview_kpis
UNPIVOT (
  SELECT
    avg("1 I feel emotionally safe and respected at work") AS "1 I feel emotionally safe and respected at work",
    avg("2 I can voice safety or ethical concerns without fear of retaliation") AS "2 I can voice safety or ethical concerns without fear of retaliation",
    avg("3 Leadership responds effectively to reported concerns") AS "3 Leadership responds effectively to reported concerns",
    avg("4 I understand how to report a safety concern") AS "4 I understand how to report a safety concern",
    avg("5 Safety policies and procedures are clear and accessible") AS "5 Safety policies and procedures are clear and accessible",
    avg("6 I feel physically safe in my work setting") AS "6 I feel physically safe in my work setting",
    avg("7 My workload is manageable and allows me to maintain work-life balance") AS "7 My workload is manageable and allows me to maintain work-life balance",
    avg("8 My work environment (equipment, space, tools) supports me in performing my job safely") AS "8 My work environment (equipment, space, tools) supports me in performing my job safely",
    avg("9 My supervisor/manager listens to my concerns and takes them seriously") AS "9 My supervisor/manager listens to my concerns and takes them seriously",
    avg("10 My supervisor/manager supports my professional growth and safety on the job") AS "10 My supervisor/manager supports my professional growth and safety on the job",
    avg("11 I receive clear communication and direction from supervisors or leadership") AS "11 I receive clear communication and direction from supervisors or leadership",
    avg("T1 I have access to clinical support or supervision when safety issues arise") AS "T1 I have access to clinical support or supervision when safety issues arise",
    avg("T2 I feel supported in managing client crises (e.g., de-escalation, hospitalization needs)") AS "T2 I feel supported in managing client crises (e.g., de-escalation, hospitalization needs)",
    avg("T3 I am confident in addressing client safety risks (e.g., harm to self/others)") AS "T3 I am confident in addressing client safety risks (e.g., harm to self/others)",
    avg("NP1 I feel informed about the agency’s procedures for psychiatric crises") AS "NP1 I feel informed about the agency’s procedures for psychiatric crises",
    avg("NP2 Collaboration between medical and clinical teams supports safe, integrated care") AS "NP2 Collaboration between medical and clinical teams supports safe, integrated care",
    avg("NP3 I feel supported when managing medication-related concerns or emergencies") AS "NP3 I feel supported when managing medication-related concerns or emergencies",
    avg("Q1 I feel prepared to handle safety concerns during community-based work") AS "Q1 I feel prepared to handle safety concerns during community-based work",
    avg("Q2 I know how to escalate concerns about client behavior or safety") AS "Q2 I know how to escalate concerns about client behavior or safety",
    avg("Q3 I feel equipped to set healthy boundaries while supporting clients") AS "Q3 I feel equipped to set healthy boundaries while supporting clients",
    avg("A1 I feel safe and respected in my interactions with staff and clients") AS "A1 I feel safe and respected in my interactions with staff and clients",
    avg("A2 I know what to do if I witness or experience an unsafe or uncomfortable situation") AS "A2 I know what to do if I witness or experience an unsafe or uncomfortable situation",
    avg("A3 I feel included in the agency’s overall communication about safety policies") AS "A3 I feel included in the agency’s overall communication about safety policies"
  FROM
    blast_warehouse.safety_culture_assessment_2025
)
ON columns(*) INTO NAME Question VALUE Average
```

<DataTable
  data={overview_kpis}
  rows=all
/>
