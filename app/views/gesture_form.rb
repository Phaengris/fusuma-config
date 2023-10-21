require 'ostruct'

class ViewModels::GestureForm
  attr_accessor :gesture
  attr_reader :fingers
  attr_reader :gesture_name
  attr_reader :gesture_supported_fingers
  attr_reader :gesture_supported_directions

  def gesture=(gesture)
    raise ArgumentError, "Gesture is already set" if @gesture

    @gesture = gesture
    @gesture_name = gesture.to_s.capitalize # TODO: use i18n
    @gesture_supported_fingers = Gesture.get_instance(gesture).supported_fingers
    @gesture_supported_directions = Gesture.get_instance(gesture).supported_directions

    @fingers = @gesture_supported_fingers.map do |finger|
      finger_model = Finger.new(siblings: @fingers)
      [finger, finger_model]
    end.to_h

    if @gesture_supported_directions&.any?
      @fingers.each do |finger, finger_model|
        @gesture_supported_directions.each do |direction|
          finger_model.add_direction(direction)
        end
      end
    end
  end

  def gesture_name
    @gesture_name ||= gesture.to_s.capitalize # TODO: use i18n
  end

  def finger_name(finger)
    "#{finger} finger#{"s" if finger > 1}" # TODO: use i18n
  end

  def finger_config_name(finger, direction = nil)
    "Configuration for #{finger_name(finger)} #{gesture}#{" #{direction}" if direction}" # TODO: use i18n
  end

  def direction_name(direction)
    direction.to_s.capitalize # TODO: use i18n
  end

  private

  class EditableElement
    attr_accessor :enabled
    attr_accessor :currently_edited

    def initialize(siblings: nil)
      @siblings = siblings
      observe_enabled
      observe_currently_edited
    end

    private

    def observe_enabled
      Glimte::Utils::Observer.observe(self, :enabled) do |new_enabled|
        if new_enabled
          self.currently_edited = true
        else
          self.currently_edited = false if self.currently_edited
        end
      end
    end

    def observe_currently_edited
      Glimte::Utils::Observer.observe(self, :currently_edited) do |new_currently_edited|
        if new_currently_edited
          @siblings&.values&.each do |sibling|
            sibling.currently_edited = false if sibling != self
          end
        end
      end
    end
  end

  class Finger < EditableElement
    attr_reader :directions

    def initialize(siblings: nil)
      super
      @directions = {}
    end

    def add_direction(direction)
      @directions[direction] = EditableElement.new(siblings: @directions)
    end
  end

end