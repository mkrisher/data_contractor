RSpec.describe DataContractor::Parser do
  subject { described_class.new }

  describe "#read" do
    it "accepts yaml formatted files" do
      file = File.open("spec/files/orders_latest.yaml")

      expect(subject.read(file).empty?).to eq(false)
    end

    it "does not accept yaml formatted files that are empty" do
      file = File.open("spec/files/empty.yaml")

      expect(subject.read(file).empty?).to eq(true)
    end

    it "does accept json formatted files" do
      file = File.open("spec/files/orders_latest.json")

      expect(subject.read(file).empty?).to eq(false)
    end

    it "does not accept invalid yaml files" do
      file = File.open("spec/files/invalid.yaml")

      expect(subject.read(file).empty?).to eq(true)
    end
  end

  describe "#specification" do
    it "identifies a DCS spec" do
      file = File.open("spec/files/dcs.yaml")
      subject.read(file)

      expect(subject.specification.is_a?(DataContractor::Dcs)).to eq(true)
    end

    it "identifies a ODCS spec" do
      file = File.open("spec/files/odcs.yaml")
      subject.read(file)

      expect(subject.specification.is_a?(DataContractor::Odcs)).to eq(true)
    end

    it "returns nil if the spec can not be inferred" do
      file = File.open("spec/files/empty.yaml")
      subject.read(file)

      expect(subject.specification).to eq(nil)
    end
  end
end
