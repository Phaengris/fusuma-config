class ViewModels::GestureFingerForm
  attr_accessor :config_path
  attr_accessor :title
  attr_reader :gesture
  attr_reader :finger
  attr_reader :direction
  attr_reader :gesture_supported_states
  attr_accessor :is_single_action
  attr_accessor :is_repeating_action

  def config_path=(*config_path)
    raise ArgumentError, "Config path is already set" if @config_path

    @config_path = Array(config_path)
    @gesture, @finger, @direction = @config_path
    @gesture_supported_states = Gesture.get_instance(@gesture).supported_states
  end
end