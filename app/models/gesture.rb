require 'singleton'

class Gesture
  include Singleton

  def self.get_instance(gesture_id)
    @instances ||= {}
    @instances[gesture_id] ||= Gestures.const_get(gesture_id.to_s.capitalize).instance
  end

  def supported_fingers
    @supported_fingers ||= (1..5).to_a
  end

  def supported_states
    raise NotImplementedError
  end

  def supported_directions
    raise NotImplementedError
  end
end