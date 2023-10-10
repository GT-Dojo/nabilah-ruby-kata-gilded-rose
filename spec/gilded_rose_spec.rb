# frozen_string_literal: true

require './app/gilded_rose'

describe GildedRose do

  describe '#update_quality' do
    it 'does not change the name' do
      items = [Item.new('foo', 0, 0)]
      described_class.new(items).update_quality
      expect(items[0].name).to eq 'foo'
    end

    it 'sellIn date has passed, quality degrades twice as fast' do
      items = [Item.new('foo', -1, 100)]
      described_class.new(items).update_quality
      expect(items[0].quality).to eq 98
    end

    context 'when item is not Aged Brie, Sulfuras or Backstage passes' do
      it 'item reduce by 1 when sellIn> 0 and quality >0' do
        items = [Item.new('foo', 1, 100)]
        described_class.new(items).update_quality
        expect(items[0].quality).to eq 99
      end
    end


  end
end
