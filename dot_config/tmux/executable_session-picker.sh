#!/bin/bash
while true; do
  result=$(tmux list-sessions -F "#{session_name}" | fzf --reverse --no-info \
    --header "enter:switch / c:new / d:kill / r:rename" \
    --disabled \
    --expect "c,d,r")

  key=$(echo "$result" | head -1)
  session=$(echo "$result" | tail -1)

  case "$key" in
    c)
      printf "Session name: "
      read -r name
      [ -n "$name" ] && tmux new-session -d -s "$name" && tmux switch-client -t "$name"
      ;;
    d)
      [ -z "$session" ] && continue
      printf "Kill session '%s'? (y/N): " "$session"
      read -r confirm
      if [ "$confirm" = "y" ]; then
        current=$(tmux display-message -p '#{session_name}')
        if [ "$session" = "$current" ]; then
          tmux switch-client -n
        fi
        tmux kill-session -t "$session"
      fi
      ;;
    r)
      [ -z "$session" ] && continue
      printf "New name: "
      read -r name
      [ -n "$name" ] && tmux rename-session -t "$session" "$name"
      ;;
    *)
      [ -n "$session" ] && tmux switch-client -t "$session"
      break
      ;;
  esac
done
