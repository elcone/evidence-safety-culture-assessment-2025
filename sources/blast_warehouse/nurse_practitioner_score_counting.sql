WITH cte_scores AS (
  UNPIVOT (
    SELECT
      columns('^NP\d.*')
    FROM
      rdbhs.safety_culture_assessment_2025
  )
  ON columns(*)
  INTO NAME Question VALUE Score
)
SELECT
  regexp_extract(Question, '(NP\d+)', 1) AS Code,
  Question,
  Score,
  count(*) AS Counts
FROM
  cte_scores
GROUP BY
  Code,
  Question,
  Score
