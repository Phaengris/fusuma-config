# text view_model.gesture_name
# text 'gesture'

view_model.gesture_supported_fingers.each do |finger|

  if view_model.gesture_supported_directions&.any?
    view_model.gesture_supported_directions.each do |direction|
      @select_action_form = Views.select_action_form {
        title view_model.finger_direction_name(finger, direction)
        config_path :swipe, finger, direction
      }
      view_model.gesture_supported_states.each do |state|
        Views.select_action_form {
          title view_model.state_name(state)
          visible <=> [@select_action_form, :visible]
          config_path :swipe, finger, direction, state
        }
      end # states
    end # directions

  else
    @select_action_form = Views.select_action_form {
      title view_model.finger_name(finger)
      config_path :swipe, finger
    }
    view_model.gesture_supported_states.each do |state|
      Views.select_action_form {
        title view_model.state_name(state)
        visible <=> [@select_action_form, :visible]
        config_path :swipe, finger, state
      }
    end # states
  end

end # fingers
