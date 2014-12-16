require "common_errs/version"
require "common_errs/collection"

module CommonErrs

  attr_reader :options

  def has_common_errs(options={})
    @options = options
    include InstanceMethods
  end

  module InstanceMethods
    def errors
      @errors ||= CommonErrs::Collection.new
    end

    def valid?
      errors.none?
    end
  end
end
