RSpec.describe DataContractor::Contract do
  subject { described_class.new }

  describe "#import" do
    it "imports a valid yaml file assigning attributes" do
      file = File.open("spec/files/orders_latest.yaml")

      expect(subject.import(file)).to eq(true)
      expect(subject.data.nil?).to eq(false)
      expect(subject.specification.is_a?(DataContractor::Dcs)).to eq(true)
    end
  end

  describe "#specification_version" do
    it "returns the version of the specification" do
      file = File.open("spec/files/orders_latest.yaml")
      subject.import(file)

      expect(subject.specification_version).to eq("0.9.3")
    end
  end
end
