#--
#           DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#                   Version 2, December 2004
#
#  Copyleft meh. [http://meh.paranoid.pk | meh@paranoici.org]
#
#           DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#  TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
#
#  0. You just DO WHAT THE FUCK YOU WANT TO.
#++

class Retarded
  class << self
    def normalize (value)
      if (value.___is_retarded___ rescue false)
        ~value
      else
        value
      end
    end; alias - normalize
  end

  tmp, $VERBOSE = $VERBOSE, nil
  Object.instance_methods.each {|meth|
    undef_method meth
  }
  $VERBOSE = tmp

  def initialize (*arguments, &block)
    @arguments = arguments
    @block     = block

    @mutex = defined?(Mutex) ? Mutex.new : Class.new {
      def synchronize (&block)
        block.call
      end
    }.new
  end
  
  def __get_retarded__
    @mutex.synchronize {
      return @result if @executed

      @result    = @block.call(*@arguments)
      @executed  = true
      @block     = nil
      @arguments = nil
    }
  end; alias ~ __get_retarded__

  def ___is_retarded___; true; end
  
  def method_missing (id, *args, &block)
    __get_retarded__.__send__(id, *args, &block)
  end
end
