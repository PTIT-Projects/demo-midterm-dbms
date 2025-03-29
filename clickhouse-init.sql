`CREATE DATABASE IF NOT EXISTS otel_db;

-- For traces
CREATE TABLE IF NOT EXISTS otel_db.traces
(
    trace_id String,
    span_id String,
    parent_span_id String,
    name String,
    kind String,
    start_time DateTime64(9),
    end_time DateTime64(9),
    duration_ms Float64,
    service_name String,
    resource_attributes Map(String, String),
    span_attributes Map(String, String),
    status_code String,
    status_message String,
    events Nested(
        timestamp DateTime64(9),
        name String,
        attributes Map(String, String)
    ),
    links Nested(
        trace_id String,
        span_id String,
        attributes Map(String, String)
    )
) ENGINE = MergeTree()
ORDER BY (service_name, trace_id, start_time);

-- For metrics
CREATE TABLE IF NOT EXISTS otel_db.metrics
(
    timestamp DateTime64(9),
    name String,
    description String,
    unit String,
    type String,
    value Float64,
    exemplars Nested(
        filtered_attributes Map(String, String),
        timestamp DateTime64(9),
        value Float64,
        span_id String,
        trace_id String
    ),
    attributes Map(String, String),
    resource_attributes Map(String, String),
    service_name String
) ENGINE = MergeTree()
ORDER BY (service_name, name, timestamp);

-- For logs
CREATE TABLE IF NOT EXISTS otel_db.logs
(
    timestamp DateTime64(9),
    severity_text String,
    severity_number Int32,
    body String,
    resource_attributes Map(String, String),
    attributes Map(String, String),
    service_name String,
    trace_id String,
    span_id String
) ENGINE = MergeTree()
ORDER BY (service_name, timestamp);`