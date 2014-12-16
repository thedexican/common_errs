require 'spec_helper'

describe CommonErrs do
  let(:included_klass) {
      Class.new do
        extend CommonErrs
        has_common_errs({formatted_as: :list})
      end
    }
  subject { included_klass.new }

  it "should have options" do
    expected = { formatted_as: :list }
    expect(subject.class.options).to eq(expected)
  end

  describe "#errors" do
    it "should be an instance of CommonErrs::Collection" do
      expect(subject.errors).to be_a CommonErrs::Collection
    end
  end

  describe "#valid?" do
    it "returns true when empty" do
      expect(subject.errors.messages.length).to eq(0)
      expect(subject.valid?).to eq(true)
    end

    it "returns false when populated" do
      subject.errors.add("this is an error")

      expect(subject.valid?).to eq(false)
    end
  end
end


