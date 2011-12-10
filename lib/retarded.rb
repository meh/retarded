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

require 'blankslate'

class Retarded < BlankSlate
	class Mutex
		def synchronize (&block)
			block.call
		end
	end

	class << self
		def normalize (value)
			if (value.___is_retarded___ rescue false)
				~value
			else
				value
			end
		end; alias - normalize
	end

	def initialize (*arguments, &block)
		@arguments = arguments
		@block     = block

		@mutex = defined?(::Mutex) ? ::Mutex.new : ::Retarded::Mutex.new
	end
	
	def ___get_retarded___
		@mutex.synchronize {
			return @result if @executed

			@result = @block.call(*@arguments).tap {
				@executed  = true
				@block     = nil
				@arguments = nil
			}
		}
	end; alias ~ ___get_retarded___

	def ___is_retarded___; true; end
	
	def method_missing (id, *args, &block)
		___get_retarded___.__send__(id, *args, &block)
	end
end

module Kernel
	def Retarded (*args, &block)
		Retarded.new(*args, &block)
	end
end
