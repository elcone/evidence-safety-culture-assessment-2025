---
queries:
  - questions_groups: questions_groups.sql
---

# {params.Group}

```sql codes
SELECT DISTINCT Code, Question
FROM blast_warehouse.safety_culture_assessment_2025_results
WHERE "Question Group" = '${params.Group}'
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
GROUP BY
  Code,
  Question,
  Score
```

{#each codes as row}

## {row.Question}

{@const average_row = averages.where(`Code = '${row.Code}'`)}
{@const score_rows = countings.where(`Code = '${row.Code}'`)}

<BigValue
  data={average_row}
  value="Average"
/>

<BarChart
  data={score_rows}
  x="Score"
  y="Counts"
  series="Code"
/>

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
