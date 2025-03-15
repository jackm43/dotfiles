
function tf {
    if [ -f "variables.tfvars" ]; then
        echo "Command to be executed: terraform $1 -var-file=variables.tfvars ${@:2}"
        terraform "$1" -var-file="variables.tfvars" "${@:2}"
    else
        echo "Command to be executed: terraform $@"
        terraform "$@"
    fi
}

function ipactive {
    br_interfaces=$(ip -o addr show | grep br-)

    docker_networks=$(sudo docker network ls --format "{{.ID}}\t{{.Name}}")

    declare -A network_names

    while read -r docker_network_id docker_name; do
        network_names["$docker_network_id"]="$docker_name"
    done <<< "$docker_networks"

    echo "$br_interfaces" | while read -r line; do
        br_name=$(echo $line | awk '{print $2}')
        ip_addr=$(echo $line | awk '$4 != "<link>" { print $4 }')

        docker_network_id=${br_name#br-}

        if [ -n "${network_names[$docker_network_id]}" ]; then
            echo "Bridge: $br_name, IP Address: $ip_addr, Network Name: ${network_names[$docker_network_id]}"
        else
            echo "No matching Docker network found for bridge $br_name with IP address $ip_addr"
        fi
    done
}

findfile() {
  if [ -n "$1" ]; then
    find . -name "$1" | xargs dirname
  else
    read -p "Enter search (eg *.ext): " fileName
    find . -name "$fileName" | xargs dirname
  fi
}
