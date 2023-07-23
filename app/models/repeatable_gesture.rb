class RepeatableGesture < Gesture
  def supported_states
    @supported_states ||= [:begin, :update, :end]
  end
end