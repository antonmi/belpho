require 'spec_helper'

describe 'Problems files' do

  before do
    @yaml = Year.parse('problems.yml')
  end

  it 'should parse problems.yml' do
    expect(Year.yaml).to be_instance_of Hash
    expect(Year.yaml[2012]).to be_instance_of Hash
  end

  it 'should have all years' do
    (1990..2012).to_a.each do |year|
      expect(@yaml[year]).to be_instance_of Hash
    end
  end

  it 'should check presence of all files' do
    @yaml.each_value do |value|
      %w(final, third).each do |etap|
        if hash = value[etap]
          %i(problems solutions th-problems th-solutions exp-problems exp-solutions).each do |pr|
            if hash[pr]
              file = File.open("public/problems/#{etap}/#{hash[pr]}")
              expect(file).to be_instance_of File
            end
          end
        end
      end
    end
  end

  it 'should check filename validity. Contain proper name' do
    @yaml.each do |year, value|
      %w(final, third).each do |etap|
        if hash = value[etap]
          %w(problems solutions th-problems th-solutions exp-problems exp-solutions).each do |pr|
            (hash[pr] =~ Regexp.new(year.to_s)).should_not be_nil if hash[pr]
          end
        end
      end
    end
  end

  it 'should create Problem instances' do
    Year.years.each { |i| expect(i).to be_instance_of Year }
  end


end