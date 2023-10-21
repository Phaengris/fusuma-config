frame {
  grid sticky: 'nse', row: 0, column: 0, column_weight: 0, row_weight: 1
  padding 0

  finger_switches
}

frame {
  padding 20, 0, 0, 0
  grid row: 0, column: 1, column_weight: 1, row_weight: 1

  view_model.gesture_supported_fingers.each do |finger|
    if view_model.gesture_supported_directions&.any?
      frame {
        padding 0, 0, 0, 10

        direction_switches finger: finger
      }
      view_model.gesture_supported_directions.each do |direction|
        Views.gesture_finger_form {
          title view_model.finger_config_name(finger, direction)
          visible <= [view_model.fingers[finger].directions[direction], :currently_edited]
          config_path view_model.gesture, finger, direction
        }
      end
    else
      Views.gesture_finger_form {
        title view_model.finger_config_name(finger)
        visible <= [view_model.fingers[finger], :currently_edited]
        config_path view_model.gesture, finger
      }
    end
  end
}
