#!/bin/sh
providers="$(hclq get terraform.required_providers.*.source --in main.tf | awk '{ gsub(/[\[\]"]/, ""); gsub(/,/, " "); print }')"
versions="$(hclq get terraform.required_providers.*.version --in main.tf)"

for each in $providers
do
	provider="$(echo $each | awk -F '/' '{print $2}')"
	latest="$(curl "https://registry.terraform.io/v1/providers/${each}" 2>/dev/null | jq .version -r)"
	hclq set terraform.required_providers.${provider}.version "${latest}" --in main.tf --out main.tf
done
