WITH cte_groups AS (
    SELECT DISTINCT "Question Group" AS _Group
    FROM blast_warehouse.safety_culture_assessment_2025_results
)

SELECT
    _Group,
    CASE
        WHEN _Group = 'Core Safety Culture' THEN 1
        WHEN _Group = 'Therapist' THEN 2
        WHEN _Group = 'Nurse Practitioner' THEN 3
        WHEN _Group = 'QMHS' THEN 4
        WHEN _Group = 'Administrative Personnel' THEN 5
    END AS _Order
FROM cte_groups
ORDER BY _Order
