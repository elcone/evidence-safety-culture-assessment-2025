---
queries:
  - questions_groups: questions_groups.sql
---

# {params.Group}

```sql codes
SELECT DISTINCT Code, Question
FROM blast_warehouse.safety_culture_assessment_2025_results
WHERE
  "Question Group" = '${params.Group}'
  AND Role LIKE '${inputs.selected_role.value}'
ORDER BY try_cast(Code AS int), Code
```

```sql averages
SELECT
  Code,
  Question,
  avg(Score) AS Average
FROM
  blast_warehouse.safety_culture_assessment_2025_results
WHERE
  "Question Group" = '${params.Group}'
  AND Role LIKE '${inputs.selected_role.value}'
GROUP BY
  Code,
  Question
```

```sql countings
SELECT
  Code,
  Question,
  Score,
  count(*) AS Counts
FROM
  blast_warehouse.safety_culture_assessment_2025_results
WHERE
  "Question Group" = '${params.Group}'
  AND Role LIKE '${inputs.selected_role.value}'
GROUP BY
  Code,
  Question,
  Score
```

```sql roles
SELECT Role
FROM blast_warehouse.safety_culture_assessment_2025_results
WHERE "Question Group" = '${params.Group}'
GROUP BY Role
ORDER BY Role
```

```sql total_participants
SELECT count(DISTINCT "File name") AS total_participants
FROM blast_warehouse.safety_culture_assessment_2025_results
WHERE
  "Question Group" = '${params.Group}'
  AND Role LIKE '${inputs.selected_role.value}'
```

<Note>
  Some Staff members answered questions that are not assigned to their role, you can filter a specific role using the dropdown below.
</Note>

<Dropdown
  name=selected_role
  data={roles}
  value=Role
  title="Select a Role"
>
  <DropdownOption value="%" valueLabel="All Roles"/>
</Dropdown>

<div>
  <BigValue
    data={total_participants}
    value="total_participants"
  />
</div>

{#each codes as row}

## {row.Question}

{@const average_row = averages.where(`Code = '${row.Code}'`)}
{@const score_rows = countings.where(`Code = '${row.Code}'`)}

<BigValue
  data={average_row}
  value="Average"
/>

<Tabs background=true>
  <Tab label="Bar Chart">
    <BarChart
      data={score_rows}
      x="Score"
      y="Counts"
      seriesLabels=false
    />
  </Tab>

  <Tab label="Donut Chart">
    <QuestionDonutResults
      group={params.Group}
      role={inputs.selected_role.value}
      code={row.Code}
    />
  </Tab>
</Tabs>

{/each}

## Individual Results

```sql individual_results
WITH cte_results AS (
  SELECT
    "File name",
  	Question,
  	Score
  FROM blast_warehouse.safety_culture_assessment_2025_results
  WHERE
    "Question Group" = '${params.Group}'
    AND Role LIKE '${inputs.selected_role.value}'
)
PIVOT cte_results
ON "File name"
USING sum(Score)
```

<DataTable data={individual_results} />
