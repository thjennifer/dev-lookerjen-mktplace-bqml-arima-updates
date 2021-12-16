view: google_analytics_field_suggestions {
  derived_table: {
    sql:  SELECT REGEXP_REPLACE(SPLIT(pair, ':')[OFFSET(0)], r'^"|"$', '') AS column_name
          FROM (
                SELECT * FROM ${google_analytics_input_data.SQL_TABLE_NAME}
                LIMIT 1) t,
          UNNEST(SPLIT(REGEXP_REPLACE(to_json_string(t), r'{|}', ''), ',"')) pair
    ;;
  }

  dimension: column_name {}

}
