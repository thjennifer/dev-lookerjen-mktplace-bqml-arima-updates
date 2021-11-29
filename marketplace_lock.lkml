###################################################################################
# This is a read-only file! Its contents can be edited through the Marketplace UI #
# See the docs at: https://docs.looker.com/data-modeling/marketplace              #
###################################################################################

marketplace_ref: {
  listing: "bqml-arima"
  version: "1.0.1"
  models: ["arima_model_info", "google_analytics_forecast"]
  override_constant: CONNECTION_NAME { value:"thjennifer-looker-ps" }
  override_constant: looker_temp_dataset_name { value:"looker_scratch" }
}
