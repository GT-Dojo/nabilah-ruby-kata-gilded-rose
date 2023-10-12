# frozen_string_literal: true
require './app/item'

class Sulfuras < Item
  def initialize
    @name = 'Sulfuras, Hand of Ragnaros'
    @quality = 80
  end

end

# s = Sulfuras.new
# puts s.to_s