# Session 4 – PromQL Basics

## PromQL

PromQL is the Prometheus query language.

It selects and transforms time-series data.

---

## Instant Vector Selector

```promql
up
```

With labels:

```promql
up{job="linux-hosts"}
```

Regular expression selector:

```promql
up{instance=~"host-0[1-3].*"}
```

Negative selector:

```promql
node_filesystem_size_bytes{fstype!~"tmpfs|overlay"}
```

---

## Range Vector

```promql
http_requests_total[5m]
```

A range vector contains samples from a time window and is commonly used with rate functions.

---

## Counters and Rate

Do not graph the raw counter when you need activity per second.

Use:

```promql
rate(sample_http_requests_total[5m])
```

Aggregate by endpoint:

```promql
sum by (endpoint) (
  rate(sample_http_requests_total[5m])
)
```

---

## CPU Utilization

Idle CPU is a counter. Convert it to a rate and subtract it from 100%.

```promql
100 - (
  avg by (instance) (
    rate(node_cpu_seconds_total{
      job="linux-hosts",
      mode="idle"
    }[5m])
  ) * 100
)
```

---

## Memory Utilization

```promql
100 * (
  1 -
  node_memory_MemAvailable_bytes{job="linux-hosts"}
  /
  node_memory_MemTotal_bytes{job="linux-hosts"}
)
```

---

## Disk Free Percentage

```promql
100 *
node_filesystem_avail_bytes{
  job="linux-hosts",
  fstype!~"tmpfs|overlay|squashfs"
}
/
node_filesystem_size_bytes{
  job="linux-hosts",
  fstype!~"tmpfs|overlay|squashfs"
}
```

---

## Availability

```promql
min_over_time(up{job="linux-hosts"}[15m])
```

A value of `0` means at least one scrape failed in the selected window.

---

## Common Mistakes

- Applying `rate()` to a gauge
- Forgetting to filter filesystem types
- Using a very small rate window
- Aggregating away important labels
- Comparing series with incompatible labels
- Building queries with unbounded cardinality

---

## Exercise

Write queries for:

1. Number of healthy Linux targets
2. Highest memory utilization
3. Request rate by status code
4. Error percentage over five minutes
