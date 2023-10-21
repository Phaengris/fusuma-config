labelframe {
  text " #{view_model.title} "

  if view_model.gesture_supported_states&.any?
    actions_for_states
  else
    Views.select_action_form {
      padding 0
      config_path view_model.config_path
    }
  end
}
