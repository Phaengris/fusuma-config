require 'singleton'
require 'yaml'

class FusumaConfig
  include Singleton

  def initialize
    if File.exist?(config_path)
      @config = YAML.load_file(config_path)
      @last_modified_time = File.mtime(config_path)
    else
      @config = {}
      @last_modified_time = nil
    end
  end

  private

  def config_path
    @config_path ||= File.expand_path('~/.config/fusuma/config.yml')
  end

end