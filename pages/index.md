---
title: Safety Culture Assessment 2025
queries:
  - questions_groups: questions_groups.sql
---

## Role

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

## Years with the Agency

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

## Primary work setting

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

## Average Score by Question

```sql overview_kpis
SELECT
  Code,
  Question,
  "Question Group",
  avg(Score) AS "Average Score"
FROM
  blast_warehouse.safety_culture_assessment_2025_results
GROUP BY
  Code,
  Question,
  "Question Group"
```

{#each questions_groups as row}

### {row.\_Group}

<DataTable
  data={overview_kpis.where(`"Question Group" = '${row._Group}'`)}
  rows=all
>
  <Column id="Question" title="Question" />
  <Column id="Average Score" title="Average Score" />
</DataTable>

{/each}
