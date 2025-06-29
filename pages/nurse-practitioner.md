---
title: Nurse Practitioner
sidebar_position: 4
---

```sql codes
SELECT DISTINCT Code, Question
FROM blast_warehouse.nurse_practitioner_score_average
ORDER BY Code
```

```sql nurse_practitioner_score_average
SELECT *
FROM blast_warehouse.nurse_practitioner_score_average
```

```sql nurse_practitioner_score_counting
SELECT *
FROM blast_warehouse.nurse_practitioner_score_counting
```

{#each codes as row}

## {row.Question}

{@const average_row = nurse_practitioner_score_average.where(`Code = '${row.Code}'`)}
{@const score_rows = nurse_practitioner_score_counting.where(`Code = '${row.Code}'`)}

<BigValue
  data={average_row}
  value="Average"
/>

<BarChart
  data={score_rows}
  x="Score"
  y="Counts"
/>

{/each}
