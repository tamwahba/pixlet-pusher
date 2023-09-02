#!/usr/bin/with-contenv bashio

bashio::log.debug $(go version)

bashio::log.info $(/pixlet/pixlet version)

while read -r input; do
  bashio::log.info "Processing input..."

  device_id=$(bashio::jq "$input" '.device_id')
  bashio::log.debug "device_id: $device_id"

  api_token=$(bashio::jq "$input" '.api_token')
  bashio::log.debug "api_token: $api_token"

  script=$(bashio::jq "$input" '.script')
  bashio::log.debug "script:\n$script"

  temp_directory_path=$(mktemp -t -d "pixlet_XXXXXX")
  script_path="$temp_directory_path/script.star"
  image_path="$temp_directory_path/image.webp"
  echo "$script" > $script_path

  bashio::log.info "Rendering script..."
  /pixlet/pixlet render $script_path -o $image_path

  bashio::log.info "Pushing rendered image..."
  /pixlet/pixlet push $device_id $image_path -t $api_token
  bashio::log.info "Pushed image"
done
