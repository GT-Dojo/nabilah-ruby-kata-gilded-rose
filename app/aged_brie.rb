# frozen_string_literal: true
require './app/item'
class Aged_Brie < Item
  def initialize(sell_in, quality)
    @name = 'Aged Brie'
    @sell_in = sell_in
    @quality = quality
  end
  def update
    @sell_in -= 1
    if @quality < 50
      @quality += 1
    end
  end
end

# ab = Aged_Brie.new(2,48)
# ab.update
# puts ab.to_s

