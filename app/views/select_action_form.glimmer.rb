checkbutton {
  text view_model.title

  variable <=> [view_model, :enabled]
}

frame {
  visible <=> [view_model, :enabled]

  combobox {
    text <=> [view_model, :action_name]
    readonly true
  }

  frame {
    visible <=> [view_model, :command?, computed_by: :action_name]

    entry {
      text <=> [view_model, :command]
      button {
        text '...'
      }
    }
  }

  frame {
    visible <=> [view_model, :key?, computed_by: :action_name]

    button {
      text '...'
    }
    label {
      text ''
    }
  }

  frame {
    visible <=> [view_model, :window_action?, computed_by: :action_name]

    combobox {
      text <=> [view_model, :window_action]
      readonly true
    }
  }
}
