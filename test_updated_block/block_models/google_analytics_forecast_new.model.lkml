connection: "@{CONNECTION_NAME}"

include: "//bqml-arima/views/arima_coefficients.view"
include: "//bqml-arima/views/arima_evaluate.view"
include: "//bqml-arima/views/arima_explain_forecast.view"
include: "//bqml-arima/views/arima_forecast.view"
include: "//bqml-arima/views/arima_hyper_params.view"
include: "//bqml-arima/views/model_info.view"
include: "//bqml-arima/views/model_name.view"

include: "/test_updated_block/block_views/arima_create_model.view"
include: "/test_updated_block/block_views/new_input_data.view"

include: "/test_updated_block/block_views/google_analytics_arima_create_model.view"
include: "/test_updated_block/block_views/google_analytics_arima_training_data.view"
include: "/test_updated_block/block_views/google_analytics_field_suggestions.view"
include: "/test_updated_block/block_views/google_analytics_input_data.view"

include: "/test_updated_block/block_explores/google_analytics_field_suggestions.explore"

explore: google_analytics_forecast {
  view_name: model_name
  group_label: "Looker + BigQuery ML"
  label: "NEW BQML ARIMA Plus: Google Analytics Forecast"
  description: "Use this Explore to create BQML ARIMA Plus models to forecast various metrics using Google Analytics data"
  persist_for: "0 minutes"

  always_filter: {
    filters: [model_name.select_model_name: ""]
  }

  join: google_analytics_input_data {
    type: cross
    relationship: one_to_many
  }

  join: google_analytics_arima_training_data {
    sql:  ;;
  relationship: many_to_one
}

join: arima_hyper_params {
  sql:  ;;
relationship: many_to_one
}

join: google_analytics_arima_create_model {
  sql:  ;;
relationship: many_to_one
}

join: arima_evaluate {
  type: cross
  relationship: many_to_many
}

join: arima_forecast {
  type: full_outer
  relationship: one_to_one
  sql_on: ${google_analytics_input_data.date} = ${arima_forecast.forecast_date} ;;
}

join: arima_explain_forecast {
  type: full_outer
  sql_on: ${arima_forecast.forecast_raw} = ${arima_explain_forecast.time_series_raw} ;;
  relationship: one_to_one
}

join: arima_coefficients {
  type: cross
  relationship: many_to_many
}

join: ar_coefficients {
  sql: LEFT JOIN UNNEST(${arima_coefficients.ar_coefficients}) as ar_coefficients ;;
  relationship: one_to_many
}

join: ma_coefficients {
  sql: LEFT JOIN UNNEST(${arima_coefficients.ma_coefficients}) as ma_coefficients ;;
  relationship: one_to_many
}
}
