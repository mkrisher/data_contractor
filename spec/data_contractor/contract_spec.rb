RSpec.describe DataContractor::Contract do
  subject { described_class.new }

  it 'imports a valid yaml file returning its contents' do
    file = File.open('spec/files/orders_latest.yaml')

    expect(subject.import(file)).to eq(true)
  end
end
