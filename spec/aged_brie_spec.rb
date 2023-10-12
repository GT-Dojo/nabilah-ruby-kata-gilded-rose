# frozen_string_literal: true

require './app/aged_brie'

describe AgedBrie do

  describe '#update' do
    it 'increases in Quality the older it gets' do
      items = [AgedBrie.new(2, 48)]
      items[0].update
      expect(items[0].to_s).to eq 'Aged Brie, 1, 49'
    end
    it 'quality will never be more than 50' do
      items = [AgedBrie.new(-1, 50)]
      items[0].update
      expect(items[0].to_s).to eq 'Aged Brie, -2, 50'
    end
    it 'quality increases twice as fast after sellIn' do
      items = [AgedBrie.new(-1, 48)]
      items[0].update
      expect(items[0].to_s).to eq 'Aged Brie, -2, 50'
    end

  end
end
