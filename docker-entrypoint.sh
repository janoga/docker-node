#!/bin/bash

tpl_ext=${CONFIG_TEMPLATE_EXT:-.tpl}

if [ ! -z "$CONFIG_TEMPLATE" ]; then
  # The template file must exist and have the correct extension
  [ ! ${CONFIG_TEMPLATE: -${#tpl_ext}} == $tpl_ext ] && { echo "Config template has incorrect extension!"; exit 1; }
  [ ! -f "$CONFIG_TEMPLATE" ] && { echo "Config template doesn't exist!"; exit 1; }

  # Copy the template file to its destination
  config_file=${CONFIG_TEMPLATE%$tpl_ext}
  cp $CONFIG_TEMPLATE $config_file

  # Read env as key/val variables
  while IFS='=' read -r key val; do
    # Replace ${key} with val in template
    sed -i -e "s#\${$key}#$val#" $config_file
  done < <(env)

  # Cleanup unused placeholders
  sed -i -e 's#\${.*}##' $config_file
fi

exec "$@"
