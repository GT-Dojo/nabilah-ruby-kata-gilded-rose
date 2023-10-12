# frozen_string_literal: true
require './app/item'
class AgedBrie < Item
  def initialize(sell_in, quality)
    @name = 'Aged Brie'
    @sell_in = sell_in
    @quality = quality
  end
  def update
    @sell_in -= 1
    @quality += 1
    @quality += 1 if @sell_in < 0
    @quality = 50 if @quality > 50

  end
end
