---
title: Questions by Role
queries:
  - questions_groups: questions_groups.sql
---

Click on a Role to see its details.

```sql questions_groups_with_link
SELECT
   _Group AS Role,
   '/questions_groups/' || _Group AS link
FROM ${questions_groups}
```

<DataTable data={questions_groups_with_link} link=link/>
