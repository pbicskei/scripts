#!/bin/bash

# Check if TFE_TOKEN environment variable is set
if [ -z "$TFE_TOKEN" ]; then
  echo "Error: TFE_TOKEN is not set. Please set the TFE_TOKEN environment variable."
  exit 1
fi

# Create or overwrite the .terraformrc file with the TFE token
cat <<EOF > ~/.terraformrc
credentials "app.terraform.io" {
  token = "$TFE_TOKEN"
}
EOF

chmod 600 ~/.terraformrca
echo ".terraformrc file created with TFE token."
