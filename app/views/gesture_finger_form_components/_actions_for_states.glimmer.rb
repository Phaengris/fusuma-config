frame {
  padding 0, 0, 0, 10
  radiobutton {
    grid sticky: 'w', row: 0, column: 0
    text 'Single action'
    value 'single_action'
    variable <=> [view_model, :is_single_action]
  }
  radiobutton {
    grid sticky: 'w', row: 0, column: 1
    text 'Begin / Update / End actions'
    value 'begin_update_end_actions'
    variable <=> [view_model, :is_repeating_action]
  }
}
Views.select_action_form {
  visible <= [view_model, :is_single_action]
  config_path view_model.config_path
}
frame {
  padding 0
  visible <= [view_model, :is_repeating_action]
  labelframe {
    text ' Begin '
    Views.select_action_form {
      config_path view_model.config_path + [:begin]
    }
  }
  labelframe {
    grid pady: [10, 0]
    text ' Update '
    Views.select_action_form {
      config_path view_model.config_path + [:update]
    }
  }
  labelframe {
    grid pady: [10, 0]
    text ' End '
    Views.select_action_form {
      config_path view_model.config_path + [:end]
    }
  }
}
