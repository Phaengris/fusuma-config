class Gestures::Rotate
  def supported_directions
    @supported_directions ||= [:clockwise, :counterclockwise]
  end
end