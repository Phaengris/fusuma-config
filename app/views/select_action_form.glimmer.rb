padding 0

combobox {
  grid sticky: 'ew', pady: [0, 10]
  text <=> [view_model, :action_name]
  readonly true
}

frame {
  padding 0
  visible <=> [view_model, :command?, computed_by: :action_name]

  entry {
    grid sticky: 'ew', row: 0, column: 0, column_weight: 1
    text <=> [view_model, :command]
  }
  button {
    grid sticky: 'w', row: 0, column: 1
    text '...'
  }
}

frame {
  padding 0
  visible <=> [view_model, :key?, computed_by: :action_name]

  label {
    grid sticky: 'e', row: 0, column: 0, padx: [0, 10], column_weight: 1
    text 'Ctrl + A'
  }
  button {
    grid sticky: 'w', row: 0, column: 1, column_weight: 1
    text '...'
  }
}

frame {
  padding 0
  visible <=> [view_model, :window_action?, computed_by: :action_name]

  combobox {
    text <=> [view_model, :window_action]
    readonly true
  }
}
