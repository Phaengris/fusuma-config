class Gestures::Swipe < RepeatableGesture
  def supported_directions
    @supported_directions ||= [:left, :right, :up, :down]
  end
end