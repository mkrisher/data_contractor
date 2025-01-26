require_relative("../../../lib/data_contractor/specifications/dcs")
require_relative("../../../lib/data_contractor/contract")

RSpec.describe DataContractor::Dcs do
  subject { described_class.new }

  describe "#initializew" do
    it "sets the primary key" do
      expect(subject.primary_key.nil?).to be(false)
    end
  end

  describe "#valid?" do
    it "returns true if all requirements are met" do
      file = File.open("spec/files/dcs.yaml")

      contract = DataContractor::Contract.new
      contract.import(file)

      expect(subject.valid?(contract)).to eq(true)
    end

    it "returns false if all requirements are not met" do
      file = File.open("spec/files/dcs_invalid.yaml")

      contract = DataContractor::Contract.new
      contract.import(file)

      expect(subject.valid?(contract)).to eq(false)
      expect(subject.errors.nil?).to eq(false)
    end
  end
end
