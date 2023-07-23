class Gestures::Pinch
  def supported_directions
    @supported_directions ||= [:in, :out]
  end
end