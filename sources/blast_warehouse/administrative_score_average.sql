WITH cte_scores AS (
  UNPIVOT (
    SELECT
      columns('^A\d.*')
    FROM
      rdbhs.safety_culture_assessment_2025
  )
  ON columns(*)
  INTO NAME Question VALUE Score
)
SELECT
  regexp_extract(Question, '(A\d+)', 1) AS Code,
  Question,
  avg(Score) AS Average
FROM
  cte_scores
GROUP BY
  Code,
  Question
