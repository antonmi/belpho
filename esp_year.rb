require 'yaml'
class EspYear

  attr_accessor :year

  def initialize(year, etaps)
    @year = year
  end

  class << self
    def parse(file)
      @yaml = YAML.load_file("#{Dir.pwd}/#{file}")
      @years = []
      @yaml.each { |key, value| @years << EspYear.new(key, value) }
      @years.reverse!
      @yaml
    end

    def yaml
      @yaml
    end

    def years
      @years
    end
  end
end

EspYear.parse('esp_problems.yml')