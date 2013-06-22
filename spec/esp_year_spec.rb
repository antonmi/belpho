require 'spec_helper'

describe 'Problems files' do

  before do
    @yaml = EspYear.parse('esp_problems.yml')
  end

  it 'should parse esp_problems.yml' do
    expect(EspYear.yaml).to be_instance_of Hash
    expect(EspYear.yaml[2004]).to be_instance_of Hash
  end

  it 'should have all years' do
    ([1991] << (1993..2004).to_a).flatten.each do |year|
      expect(@yaml[year]).to be_instance_of Hash
    end
  end

  it 'should check presence of all files' do
    @yaml.each_value do |value|
      file = File.open("public/problems/esp/#{value['final']['problems']}")
      expect(file).to be_instance_of File
    end
  end

  it 'should check filename validity. Contain proper name' do
    @yaml.each do |year, value|
       (value['final']['problems'] =~ Regexp.new(year.to_s)).should_not be_nil
    end
  end

  it 'should create Problem instances' do
    EspYear.years.each { |i| expect(i).to be_instance_of EspYear }
  end


end