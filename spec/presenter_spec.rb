require 'spec_helper'

describe CommonErrs::Presenter do
  let(:messages) { ["syntax error", "invalid context"] }
  let(:custom_options) { {separator: ":: "} }
  subject { described_class }


  describe "#presented" do
    it "returns messages joined by a comma" do
      str = "syntax error, invalid context"

      expect(subject.new(messages).presented).to eq(str)
    end

    it "should use a custom formatter if one is passed along" do
      formatter = proc { |i| i.concat("<br />") }
      str = "syntax error<br />invalid context<br />"

      expect(subject.new(messages).presented(&formatter)).to eq(str)
    end

    it "uses global settings if the are set" do
      str = "syntax error::invalid context"
      presenter = subject.new(messages)
      presenter.instance_variable_set(:@options, {separator: "::", stuff: "moar"})

      expect(presenter.presented).to eq(str)
    end
  end

end


