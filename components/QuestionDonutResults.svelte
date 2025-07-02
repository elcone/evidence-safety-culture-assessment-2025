<script>
  import { QueryLoad } from '@evidence-dev/core-components';
  import { getQueryFunction } from '@evidence-dev/component-utilities/buildQuery';
  import { Query } from '@evidence-dev/sdk/usql';
  import { ECharts } from '@evidence-dev/core-components';

  export let group;
  export let role;
  export let code;

  let query;

  const queryFunction = Query.createReactive({
    execFn: getQueryFunction(),
    callback: (v) => (query = v)
  });

  $: queryFunction(`
    SELECT
      'Score:' || Score::int AS name,
      count(*) AS value
    FROM blast_warehouse.safety_culture_assessment_2025_results
    WHERE
      "Question Group" = '${group}'
      AND Role LIKE '${role}'
      AND Code = '${code}'
    GROUP BY Score
  `);
</script>

<QueryLoad data={query} let:loaded>
  {#if loaded.length > 0}
    <ECharts
      config={{
        tooltip: { formatter: '{b}: {c} ({d}%)' },
        series: [
          {
            type: 'pie',
            radius: ['40%', '70%'],
            data: loaded
          }
        ]
      }}
    />
  {:else}
    <p style="text-align:center; color: gray;">No data available</p>
  {/if}
</QueryLoad>
