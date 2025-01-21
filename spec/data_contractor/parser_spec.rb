RSpec.describe DataContractor::Parser do
  subject { described_class.new }

  it 'accepts yaml formatted files' do
    file = File.open('spec/files/orders_latest.yaml')

    expect(subject.import(file).empty?).to eq(false)
  end

  it 'does not accept yaml formatted files that are empty' do
    file = File.open('spec/files/empty.yaml')

    expect(subject.import(file).empty?).to eq(true)
  end

  it 'does accept json formatted files' do
    file = File.open('spec/files/orders_latest.json')

    expect(subject.import(file).empty?).to eq(false)
  end

  it 'does not accept invalid yaml files' do
    file = File.open('spec/files/invalid.yaml')

    expect(subject.import(file).empty?).to eq(true)
  end
end
