# frozen_string_literal: true

require './app/backstage_passes'

describe BackstagePasses do

  describe '#update' do
    it 'increases in Quality as its SellIn value approaches' do
      items = [BackstagePasses.new(12, 49)]
      items[0].update
      expect(items[0].to_s).to eq 'Backstage passes to a TAFKAL80ETC concert, 11, 50'
    end
    it 'Quality increases by 2 when there are 10 days or less' do
      items = [BackstagePasses.new(10, 35)]
      items[0].update
      expect(items[0].to_s).to eq 'Backstage passes to a TAFKAL80ETC concert, 9, 37'
    end
    it 'Quality increases by 3 when there are 5 days or less' do
      items = [BackstagePasses.new(5, 35)]
      items[0].update
      expect(items[0].to_s).to eq 'Backstage passes to a TAFKAL80ETC concert, 4, 38'
    end
    it 'Quality drops to 0 after the concert' do
      items = [BackstagePasses.new(0, 49)]
      items[0].update
      expect(items[0].to_s).to eq 'Backstage passes to a TAFKAL80ETC concert, -1, 0'
    end

    it 'quality will never be more than 50 before sellIn' do
      items = [BackstagePasses.new(5, 49)]
      items[0].update
      expect(items[0].to_s).to eq 'Backstage passes to a TAFKAL80ETC concert, 4, 50'
    end
  end
end
