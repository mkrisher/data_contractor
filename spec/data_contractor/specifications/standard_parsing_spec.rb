require_relative("../../../lib/data_contractor/specifications/standard_parsing")
require_relative("../../../lib/data_contractor/contract")

class Example
  include DataContractor::StandardParsing::InstanceMethods
end

RSpec.describe Example do
  PRIMARY_KEY = "dataContractSpecification"

  subject { described_class.new(PRIMARY_KEY) }

  describe "#initialize" do
    it "sets primary key during initialization" do
      expect(subject.primary_key).to eq(PRIMARY_KEY)
    end
  end

  describe "#to_s" do
    it "returns the primary key value as the string" do
      expect(subject.to_s).to eq(PRIMARY_KEY)
    end
  end

  describe "#vesrion" do
    it "returns the specification version of the contract" do
      file = File.open("spec/files/orders_latest.yaml")

      contract = DataContractor::Contract.new
      contract.import(file)

      expect(subject.version(contract)).to eq("0.9.3")
    end
  end
end
