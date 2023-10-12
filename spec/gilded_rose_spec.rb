# frozen_string_literal: true

require './app/gilded_rose'

describe GildedRose do

  describe '#update_quality' do

    it 'does not change the name' do
      items = [Item.new('foo', 0, 0)]
      described_class.new(items).update_quality
      expect(items[0].to_s).to eq 'foo, -1, 0'
    end

    context 'when item is not Aged Brie, Sulfuras or Backstage passes' do
      it 'quality will never be less than 0' do
        items = [Item.new('foo', 0, 0)]
        described_class.new(items).update_quality
        expect(items[0].to_s).to eq 'foo, -1, 0'
      end
      it 'quality reduce by 1 before sellIn date' do
        items = [Item.new('foo', 1, 50)]
        described_class.new(items).update_quality
        expect(items[0].to_s).to eq 'foo, 0, 49'
      end
      it 'sellIn date has passed, quality degrades twice as fast' do
        items = [Item.new('foo', -1, 50)]
        described_class.new(items).update_quality
        expect(items[0].to_s).to eq 'foo, -2, 48'
      end
    end

    context 'when item is Aged Brie' do
      it 'increases in Quality the older it gets' do
        items = [Item.new('Aged Brie', 2, 48)]
        described_class.new(items).update_quality
        expect(items[0].to_s).to eq 'Aged Brie, 1, 49'
      end
      it 'quality will never be more than 50' do
        items = [Item.new('Aged Brie', -1, 50)]
        described_class.new(items).update_quality
        expect(items[0].to_s).to eq 'Aged Brie, -2, 50'
      end
      it 'quality increases twice as fast after sellIn' do
        items = [Item.new('Aged Brie', -1, 45)]
        described_class.new(items).update_quality
        expect(items[0].to_s).to eq 'Aged Brie, -2, 47'
      end
    end

    context 'when item is Sulfuras' do
      it 'never has to be sold or decreases in Quality' do
        items = [Item.new('Sulfuras, Hand of Ragnaros', -1, 48)]
        described_class.new(items).update_quality
        expect(items[0].to_s).to eq 'Sulfuras, Hand of Ragnaros, -1, 48'
      end
      it 'quality will never be more than 50 before sellIn' do
        items = [Item.new('Sulfuras, Hand of Ragnaros', 4, 50)]
        described_class.new(items).update_quality
        expect(items[0].to_s).to eq 'Sulfuras, Hand of Ragnaros, 4, 50'
      end
      it 'quality will never be more than 50 after sellIn' do
        items = [Item.new('Sulfuras, Hand of Ragnaros', -4, 50)]
        described_class.new(items).update_quality
        expect(items[0].to_s).to eq 'Sulfuras, Hand of Ragnaros, -4, 50'
      end
    end

    context 'when item is Backstage passes' do
      it 'increases in Quality as its SellIn value approaches' do
        items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 11, 47)]
        described_class.new(items).update_quality
        expect(items[0].to_s).to eq 'Backstage passes to a TAFKAL80ETC concert, 10, 48'
      end
      it 'Quality increases by 2 when there are 10 days or less' do
        items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 10, 30)]
        described_class.new(items).update_quality
        expect(items[0].to_s).to eq 'Backstage passes to a TAFKAL80ETC concert, 9, 32'
      end
      it 'Quality increases by 3 when there are 5 days or less' do
        items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 5, 30)]
        described_class.new(items).update_quality
        expect(items[0].to_s).to eq 'Backstage passes to a TAFKAL80ETC concert, 4, 33'
      end
      it 'Quality drops to 0 after the concert' do
        items = [Item.new('Backstage passes to a TAFKAL80ETC concert', -1, 50)]
        described_class.new(items).update_quality
        expect(items[0].to_s).to eq 'Backstage passes to a TAFKAL80ETC concert, -2, 0'
      end

      it 'quality will never be more than 50 before sellIn' do
        items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 4, 49)]
        described_class.new(items).update_quality
        expect(items[0].to_s).to eq 'Backstage passes to a TAFKAL80ETC concert, 3, 50'
      end
    end


  end


end
