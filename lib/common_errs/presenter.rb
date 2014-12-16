module CommonErrs
  class Presenter
    def initializer(errors, options = {})
      @errors = errors
      @options = options || CommonErrs.options
      presented(errors)
    end

    def presented
      errors.join(delimeter)
    end

    private
    attr_reader :options

  end
end
