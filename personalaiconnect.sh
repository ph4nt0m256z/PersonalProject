#!/bin/bash
# flag{g1ThuBrEp0eXp05eD}

generate_key() {
    part1=$(echo -n "MTEw" | base64 --decode) 
    part2=$(printf '%s' "MDEx" | base64 --decode)
    part3=$(echo 'MDA=' | base64 --decode)
    echo "${part1}${part2}${part3}"
}

API_KEY=$(generate_key)

BASE_URL=$(echo "aHR0cHM6Ly9waGFudG9tNDA0YWkucGhhbnRvbWN0Zi5jb20" | base64 --decode)
FINAL_URL="${BASE_URL}?id=${API_KEY}"

if [[ $RANDOM -gt 1000 ]]; then
    curl "$FINAL_URL"
else
    echo "Error: Unable to connect."
fi
