module CommonErrs
  class Presenter

    def initialize(messages, options = {})
      @messages= messages
      @options = default_options.merge(options)
    end

    def presented(&block)
      if block_given?
        @messages.map { |message| block.call(message) }.join
      else
        @messages.join("#{options[:separator]}")
      end
    end

    private
    attr_reader :messages, :options

    def default_options
      if CommonErrs.respond_to?(:options)
        CommonErrs.options
      else
        { separator: ", " }
      end
    end
  end
end
