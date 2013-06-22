require 'yaml'
class Year

  attr_accessor :etaps, :year

  def initialize(year, etaps)
    @year = year
    @etaps = etaps
  end

  class << self

    def parse(file)
      @yaml = YAML.load_file("#{Dir.pwd}/#{file}")
      @years = []
      @yaml.each { |key, value| @years << Year.new(key, value) }
    end

    def yaml
      @yaml
    end

    def years
      @years
    end

  end



end

Year.parse('problems.yml')
p Year.years