#!/bin/sh
files="$(grep required_providers -nR | awk -F ':' '{ print $1}' | uniq | grep *.tf)"

for file in $files
do
	providers="$(hclq get terraform.required_providers.*.source --in ${file} | awk '{ gsub(/[\[\]"]/, ""); gsub(/,/, " "); print }')"
	for each in $providers
	do
		provider="$(echo $each | awk -F '/' '{print $2}')"
		latest="$(curl "https://registry.terraform.io/v1/providers/${each}" 2>/dev/null | jq .version -r)"
		echo "${provider} = ${latest}"
		hclq set terraform.required_providers.${provider}.version "${latest}" --in ${file} --out ${file}
	done
done
