class Gestures::Rotate < RepeatableGesture
  def supported_directions
    @supported_directions ||= [:clockwise, :counterclockwise]
  end
end