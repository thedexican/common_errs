require "common_errs/presenter"

module CommonErrs
  class Collection
    include Enumerable

    attr_reader :messages

    def initialize(options)
      @messages = []
      @options = options
    end

    def each(&block)
      messages.each{|message| block.call(message)}
    end

    def formatted(&block)
      CommonErrs::Presenter.new(messages, @options).presented(&block)
    end

    def add(message)
      messages.push(message)
    end

  end
end
