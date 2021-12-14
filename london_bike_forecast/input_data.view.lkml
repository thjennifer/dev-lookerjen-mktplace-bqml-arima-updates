include: "/test_updated_block/block_views/new_input_data.view"
view: +input_data {
  derived_table: {
    sql: select date(start_date) as start_date, count(0) as trip_count
      from `bigquery-public-data.london_bicycles.cycle_hire`
      where extract(year from start_date) = 2016
      group by 1
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: start_date {
    type: date
    datatype: date
    primary_key: yes
    sql: ${TABLE}.start_date ;;
  }

  dimension: trip_count {
    type: number
    hidden: yes
    sql: ${TABLE}.trip_count ;;
  }

  measure: total_trip_count {
    type: sum
    sql: ${trip_count} ;;
  }
  set: detail {
    fields: [start_date, trip_count]
  }
}
