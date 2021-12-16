connection: "thjennifer-looker-ps"
include: "/test_updated_block/block_views/new_input_data.view"
include: "/test_updated_block/block_views/arima_create_model.view"
include: "/test_updated_block/block_explores/bqml_arima.explore"


include: "//bqml-arima/explores/field_suggestions.explore"
#include: "//bqml-arima/explores/model_name_suggestions.explore"

include: "//bqml-arima/views/arima_coefficients.view"
include: "//bqml-arima/views/arima_evaluate.view"
include: "//bqml-arima/views/arima_explain_forecast.view"
include: "//bqml-arima/views/arima_forecast.view"
include: "//bqml-arima/views/arima_hyper_params.view"
include: "//bqml-arima/views/model_info.view"
include: "//bqml-arima/views/model_name.view"
include: "//bqml-arima/views/arima_training_data.view"
include: "//bqml-arima/views/field_suggestions.view"



include: "/london_bike_forecast/*.view"
include: "/london_bike_forecast/*.explore"


explore: london_bike_forecast {
  label: "BQML ARIMA Plus: London Bike Forecast"
  description: "Use this Explore to create BQML ARIMA Plus models to forecast bike trips"

  extends: [bqml_arima]

  join: arima_forecast {
    type:full_outer
    relationship: one_to_one
    sql_on: ${input_data.start_date} = ${arima_forecast.forecast_date} ;;
  }
}
