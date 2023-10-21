class Gestures::Pinch < RepeatableGesture
  def supported_directions
    @supported_directions ||= [:in, :out]
  end
end