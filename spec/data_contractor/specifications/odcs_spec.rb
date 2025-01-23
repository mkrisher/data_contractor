require_relative("../../../lib/data_contractor/specifications/odcs")

RSpec.describe DataContractor::Odcs do
  subject { described_class.new }

  describe "#initializew" do
    it "sets the primary key" do
      expect(subject.primary_key.nil?).to be(false)
    end
  end
end
