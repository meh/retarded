#! /usr/bin/env ruby
require 'rubygems'
require 'retarded'

describe Retarded do
  it 'works correctly' do
    def sinep
      @called ||= 0
      @called  += 1
    end

    r = Retarded.new {
      sinep

      23
    }

    r.should     == 23
    sinep.should == 2
  end
end
