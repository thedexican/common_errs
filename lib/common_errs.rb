require "common_errs/version"
require "common_errs/collection"

module CommonErrs

  attr_reader :options

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods 
    attr_reader :common_options
    def has_common_errs(options={})
      @common_options= options
    end
  end

  def errors
    @errors ||= CommonErrs::Collection.new(self.class.common_options)
  end

  def valid?
    errors.none?
  end

end
