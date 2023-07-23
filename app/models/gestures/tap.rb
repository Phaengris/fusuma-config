class Gestures::Tap < Gesture
  def supported_states
    @supported_states ||= []
  end

  def supported_directions
    @supported_directions ||= []
  end
end