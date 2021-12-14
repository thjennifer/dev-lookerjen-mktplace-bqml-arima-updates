include: "//bqml-arima/**/model_name_suggestions.explore"

explore: +model_name_suggestions {
  sql_always_where: ${model_info.explore} ='london_bike_forecast';;
}
