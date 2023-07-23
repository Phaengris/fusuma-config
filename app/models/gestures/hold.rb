class Gestures::Hold < RepeatableGesture
  def supported_directions
    @supported_directions ||= []
  end
end