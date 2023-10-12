# frozen_string_literal: true
require './app/item'
class BackstagePasses < Item
  def initialize(sell_in, quality)
    @name = 'Backstage passes to a TAFKAL80ETC concert'
    @sell_in = sell_in
    @quality = quality
  end
  def update
    @sell_in -= 1

    case
    when @sell_in <= 0
      @quality = 0
    when @sell_in <= 5
        @quality += 3
    when @sell_in <= 10
      @quality += 2
    else
      @quality += 1
    end
    @quality = 50 if @quality > 50
  end
end