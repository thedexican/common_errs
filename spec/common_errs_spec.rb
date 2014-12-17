require 'spec_helper'

describe CommonErrs do
  let(:messages) { ["syntax error", "invalid context"] }
  let(:included_klass) {
      Class.new do
        include CommonErrs
        has_common_errs({separator: "--"})
      end
    }
  subject { included_klass.new }

  it "should have options" do
    expected = { separator: "--"}
    expect(subject.class.common_options).to eq(expected)
  end

  describe "#errors" do
    it "should be an instance of CommonErrs::Collection" do
      expect(subject.errors).to be_a CommonErrs::Collection
    end

    it "allows adding errors" do
      subject.errors.add("This is just wrong")

      expect(subject.errors.messages).to include("This is just wrong")
    end

    context "decorating errors" do
      it "should use the separator defined in has_common_errs" do
        instance = subject
        instance.errors.add("This is just wrong")
        instance.errors.add("seriously, you are wrong")
        str = "This is just wrong--seriously, you are wrong"

        expect(instance.errors.formatted).to eq(str)
      end

      it "allows use of a custom formatting block" do
        instance = subject
        instance.errors.add("This is just wrong")
        instance.errors.add("seriously, you are wrong")
        formatter = Proc.new {|item| item.concat("<br />")} 
        str = "This is just wrong<br />seriously, you are wrong<br />"

        expect(instance.errors.formatted(&formatter)).to eq(str)

      end
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


