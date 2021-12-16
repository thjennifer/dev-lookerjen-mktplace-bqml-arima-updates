marketplace: {
  listing: "bqml-arima"
}

project_name: "block-bqml-arima"

constant: CONNECTION_NAME {
  #value: "bigquery_publicdata_standard_sql"
  value: "thjennifer-looker-ps"
  export: override_required
}

constant: looker_temp_dataset_name {
  value: "looker_scratch_eu"
  export: override_required
}
