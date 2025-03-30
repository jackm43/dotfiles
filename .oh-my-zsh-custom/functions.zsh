tf() {
    local cmd=$1
    local service=$2

    if [ "$cmd" = "help" ] || [ $# -eq 0 ]; then
        echo "Usage: tf <command> [service]"
        echo "Examples:"
        echo "  tf plan cloudflare    # Plan using cloudflare.auto.tfvars and target the cloudflare module"
        echo "  tf apply proxmox      # Apply using proxmox.auto.tfvars and target the proxmox module"
        echo "  tf plan               # Plan all services"
        return
    fi

    if [ -n "$service" ]; then
        local varfile="${service}.auto.tfvars"
        if [ ! -f "$varfile" ]; then
            echo "Error: ${varfile} not found"
            return 1
        fi
        terraform "$cmd" -target="module.$service"
    else
        terraform "$cmd"
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
    find . -name "$1" | map 
  else
    print "Enter search (eg *.ext): "
    read -r fileName
    find . -name "$fileName" | map 
 fi
}

dotfiles() {
  if [ "$1" = "gstatus" ]; then
    /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME status -s | \
    fzf --multi --preview '/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME diff --color=always {2}' \
    --preview-window=right:70% \
    --bind 'ctrl-a:execute(/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME add {2})+reload(/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME status -s),tab:execute(vim {2})'
  elif [ "$1" = "gadd" ]; then
    /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME status -s | awk '{print $2}' | \
    fzf --multi --preview '/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME diff --color=always {}' \
    --preview-window=right:70% | xargs -I{} /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME add "{}"
  elif [ "$1" = "gdiff" ]; then
    /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME status -s | awk '{print $2}' | \
    fzf --preview '/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME diff --color=always {}' \
    --preview-window=right:70% --bind 'tab:execute(vim {})' | xargs -I{} /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME diff "{}"
  else
    /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME "$@"
  fi
}

find_chmod_sh() {
  local non_exec_files=$(find . -type f -name "*.sh" ! -executable)
  local file_count=$(echo "$non_exec_files" | grep -v "^$" | wc -l)

  if [ "$file_count" -eq 0 ]; then
    echo "No non-executable .sh files found in the current directory."
    return 0
  elif [ "$file_count" -eq 1 ]; then
    chmod +x $non_exec_files
    echo "Made executable: $non_exec_files"
    return 0
  else
    echo "Found $file_count non-executable .sh files:"
    echo "$non_exec_files" | nl
    read -p "Make all of these files executable? (y/n): " choice
    if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
      echo "$non_exec_files" | xargs chmod +x
      echo "Made $file_count files executable."
    else
      echo "Operation cancelled."
    fi
    return 0
  fi
}
