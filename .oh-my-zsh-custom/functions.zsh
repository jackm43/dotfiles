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

function curl-cert() {
  openssl s_client -showcerts -connect "${1}":443 -servername ${1}
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
	git --git-dir="$HOME/dotfiles/.git" --work-tree="$HOME/dotfiles" "$@";
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

git_undo_last_commit() {
  git reset --soft HEAD~1
  if [ $# -gt 0 ]; then
    git restore --staged "$@"
  fi
  echo "Last commit undone. Changes are back in your working directory."
}

bookmarks_to_markdown() {
  local input_file="${1:-bookmarks.html}"
  local output_file="${2:-bookmarks_table.md}"

  (
    echo "| URL | Description |"
    echo "| --- | ----------- |"
    cat "$input_file" | grep -o '<A HREF="[^"]*".*</A>' | sed 's/<A HREF="\([^"]*\)"[^>]*>\(.*\)<\/A>/| \1 | \2 |/'
  ) > "$output_file"

  echo "Converted $input_file to markdown table in $output_file"
}

alias_list() {
  if [ -z "$1" ]; then
    alias
  else
    alias | grep -i "$1 | sed 's/=.*//'"
  fi
}

function fh() {
    eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}

function h() {
    if [ -z "$*" ]; then
        history 1
    else
        history 1 | egrep --color=auto "$@"
    fi
}

function fshow() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" \
  | fzf --ansi --preview "echo {} \
    | grep -o '[a-f0-9]\{7\}' \
    | head -1 \
    | xargs -I % sh -c 'git show --color=always %'" \
        --bind "enter:execute:
            (grep -o '[a-f0-9]\{7\}' \
                | head -1 \
                | xargs -I % sh -c 'git show --color=always % \
                | less -R') << 'FZF-EOF'
            {}
FZF-EOF"

}

#globalias() {

 #  if [[ $LBUFFER =~ '[a-zA-Z0-9]+$' ]]; then

  #     zle _expand_alias

   #    zle expand-word

   #fi
   #zle self-insert
#}
