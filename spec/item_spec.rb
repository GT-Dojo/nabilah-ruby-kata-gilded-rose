# frozen_string_literal: true

require './app/item'

describe Item do

  describe '#update' do

    it 'does not change the name' do
      items = [Item.new('foo', 0, 0)]
      items[0].update
      expect(items[0].to_s).to eq 'foo, -1, 0'
    end

    it 'quality will never be less than 0' do
      items = [Item.new('foo', 0, 0)]
      items[0].update
      expect(items[0].to_s).to eq 'foo, -1, 0'
    end

    it 'quality reduce by 1 before sellIn date' do
      items = [Item.new('foo', 1, 50)]
      items[0].update
      expect(items[0].to_s).to eq 'foo, 0, 49'
    end

    it 'sellIn date has passed, quality degrades twice as fast' do
      items = [Item.new('foo', -1, 50)]
      items[0].update
      expect(items[0].to_s).to eq 'foo, -2, 48'
    end
  end
end
