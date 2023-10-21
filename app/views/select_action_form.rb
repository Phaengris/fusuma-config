class ViewModels::SelectActionForm
  ACTIONS_BY_ID = { command: 'Command', key: 'Key', window_action: 'Window Action' }.freeze # TODO: use i18n
  ACTIONS_BY_NAME = ACTIONS_BY_ID.invert.freeze
  # https://github.com/iberianpig/fusuma-plugin-wmctrl#properties
  WINDOW_ACTIONS_BY_ID = {
    workspace_prev: 'Switch to previous workspace',
    workspace_next: 'Switch to next workspace',
    window_prev: 'Move window to previous workspace',
    window_next: 'Move window to next workspace',
    window_up: 'Move window to workspace above',
    window_down: 'Move window to workspace below',
    window_left: 'Move window to workspace to the left',
    window_right: 'Move window to workspace to the right',
    fullscreen_add: 'Enable fullscreen mode',
    fullscreen_remove: 'Disable fullscreen mode',
    fullscreen_toggle: 'Toggle fullscreen mode',
    maximize_add: 'Maximize window',
    maximize_remove: 'Unmaximize window',
    maximize_toggle: 'Toggle maximize window',
  }.freeze # TODO: use i18n
  WINDOW_ACTIONS_BY_NAME = WINDOW_ACTIONS_BY_ID.invert.freeze

  attr_accessor :title
  attr_accessor :enabled
  attr_accessor :config_path
  attr_accessor :action_name
  attr_accessor :action
  attr_accessor :command
  attr_accessor :key
  attr_accessor :window_action

  def initialize
    self.action_name = ACTIONS_BY_ID[:command]
  end

  def config_path=(*config_path)
    raise ArgumentError, "Config path is already set" if @config_path

    @config_path = Array(config_path)
  end

  def action=(action)
    return if @action == action

    @action = action
    # with this extra assigment we give Glimmer's binding a chance to update the UI
    action_name = @action_name = ACTIONS_BY_ID[action]
  end

  def action_name=(action_name)
    return if @action_name == action_name

    @action_name = action_name
    # with this extra assigment we give Glimmer's binding a chance to update the UI
    action = @action = ACTIONS_BY_NAME[action_name]
  end

  def action_name_options
    @action_name_options ||= ACTIONS_BY_ID.values
  end

  def window_action_options
    @window_action_options ||= WINDOW_ACTIONS_BY_ID.values
  end

  def command?
    action == :command
  end

  def key?
    action == :key
  end

  def window_action?
    action == :window_action
  end
end