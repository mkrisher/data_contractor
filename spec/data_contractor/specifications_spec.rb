RSpec.describe DataContractor::Specifications do
  subject { described_class }

  it 'defines the standards supported' do
    expect(subject.const_defined?(:STANDARDS)).to eq(true)
  end

  it 'defines a class for the Data Contract Specification standard' do
    expect(DataContractor.const_defined?(:Dcs)).to eq(true)
  end

  it 'defines a class for the Open Data Contract Standard standard' do
    expect(DataContractor.const_defined?(:Odcs)).to eq(true)
  end
end
