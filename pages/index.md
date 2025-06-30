# Safety Culture Assessment 2025

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

### Core Safety Culture

<DataTable
data={overview_kpis.where(`"Question Group" = 'CORE'`)}
rows=all>
<Column id="Code" title="Code" />
<Column id="Question" title="Question" />
<Column id="Average Score" title="Average Score" />
</DataTable>

### Therapist Role

<DataTable
data={overview_kpis.where(`"Question Group" = 'THERAPIST'`)}
rows=all>
<Column id="Code" title="Code" />
<Column id="Question" title="Question" />
<Column id="Average Score" title="Average Score" />
</DataTable>

### Nurse Practitioner Role

<DataTable
data={overview_kpis.where(`"Question Group" = 'NP'`)}
rows=all>
<Column id="Code" title="Code" />
<Column id="Question" title="Question" />
<Column id="Average Score" title="Average Score" />
</DataTable>

### Administrative Personnel Role

<DataTable
data={overview_kpis.where(`"Question Group" = 'ADMINISTRATIVE_PERSONNEL'`)}
rows=all>
<Column id="Code" title="Code" />
<Column id="Question" title="Question" />
<Column id="Average Score" title="Average Score" />
</DataTable>

### QMHS Role

<DataTable
data={overview_kpis.where(`"Question Group" = 'QMHS'`)}
rows=all>
<Column id="Code" title="Code" />
<Column id="Question" title="Question" />
<Column id="Average Score" title="Average Score" />
</DataTable>
