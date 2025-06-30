---
title: Therapist
sidebar_position: 3
---

```sql codes
SELECT DISTINCT Code, Question
FROM blast_warehouse.therapist_score_average
ORDER BY Code
```

```sql therapist_score_average
SELECT *
FROM blast_warehouse.therapist_score_average
```

```sql therapist_score_counting
SELECT *
FROM blast_warehouse.therapist_score_counting
```

{#each codes as row}

## {row.Question}

{@const average_row = therapist_score_average.where(`Code = '${row.Code}'`)}
{@const score_rows = therapist_score_counting.where(`Code = '${row.Code}'`)}

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
