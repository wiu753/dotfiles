if initialize_session "my_session"; then
  new_window "1"
  new_window "2"
  new_window "3"
  new_window "4"
  new_window "5"
  new_window "0"
  select_window 6
  tmux move-window -t 0
fi

finalize_and_go_to_session
