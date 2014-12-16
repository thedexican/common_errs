require "common_errs/presenter"

module CommonErrs
  class Collection
    include Enumerable

    attr_reader :messages

    def initialize
      @messages = []
    end

    def each(&block)
      messages.each{|message| block.call(message)}
    end

    def formatted(options = {})
      CommonErrs::Presenter.new(messages, opts).presented
    end

    def add(message)
      messages.push(message)
    end

  end
end
