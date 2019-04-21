require 'dry/monads/result'

module ApplicationFormObject
  module FormObjectResponder
    class Responder
      def initialize(monad)
        @monad = monad
      end

      def success(&block)
        return unless @monad.success?
        @monad.result(nil, block)
      end

      def failure(&block)
        return unless @monad.failure?
        @monad.result(block, nil)
      end
    end

    def save
      monad = super
      if block_given?
        struct = Responder.new(monad)
        yield(struct)
      else
        monad
      end
    end
  end

  def self.included(klass)
    klass.prepend(FormObjectResponder)
    klass.include(Dry::Monads::Result::Mixin)
    klass.include(ActiveModel::Model)
  end
end
