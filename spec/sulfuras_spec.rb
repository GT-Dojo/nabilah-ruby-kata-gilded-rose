# frozen_string_literal: true

require './app/sulfuras'

describe Sulfuras do

  describe '#update' do
    it 'does not increases in Quality the older it gets' do
      items = [Sulfuras.new]
      items[0].update
      expect(items[0].to_s).to eq 'Sulfuras, , 80'
    end
    it 'quality will never be more than 80' do
      items = [Sulfuras.new]
      items[0].update
      expect(items[0].to_s).to eq 'Sulfuras, , 80'
    end


  end
end
