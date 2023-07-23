class ViewModels::GestureForm
  attr_accessor :gesture
  attr_reader :gesture_name
  attr_reader :gesture_supported_fingers
  attr_reader :gesture_supported_directions
  attr_reader :gesture_supported_states

  def gesture=(gesture)
    raise ArgumentError, "Gesture is already set" if @gesture

    @gesture = gesture
    @gesture_name = gesture.to_s.capitalize # TODO: use i18n
    @gesture_supported_fingers = Gesture.get_instance(gesture).supported_fingers
    @gesture_supported_directions = Gesture.get_instance(gesture).supported_directions
    @gesture_supported_states = Gesture.get_instance(gesture).supported_states
  end

  def gesture_name
    @gesture_name ||= gesture.to_s.capitalize # TODO: use i18n
  end

  def finger_name(finger)
    "Finger #{finger}" # TODO: use i18n
  end

  def finger_direction_name(finger, direction)
    "#{finger_name(finger)} #{direction}" # TODO: use i18n
  end

  def state_name(state)
    state.to_s.capitalize # TODO: use i18n
  end
end