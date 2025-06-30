---
title: Core Safety Culture
sidebar_position: 2
---

```sql codes
SELECT DISTINCT Code, Question
FROM blast_warehouse.general_score_average
ORDER BY Code
```

```sql general_score_average
SELECT *
FROM blast_warehouse.general_score_average
```

```sql general_score_counting
SELECT *
FROM blast_warehouse.general_score_counting
```

{#each codes as row}

## {row.Question}

{@const average_row = general_score_average.where(`Code = '${row.Code}'`)}
{@const score_rows = general_score_counting.where(`Code = '${row.Code}'`)}

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
