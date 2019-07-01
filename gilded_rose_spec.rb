require File.join(File.dirname(__FILE__), 'gilded_rose')

describe GildedRose do
  describe '#update_quality' do
    it 'does not change the name' do
      items = [Item.new('Sulfuras, Hand of Ragnaros', 0, 80)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq 'Sulfuras, Hand of Ragnaros'
    end
    
    it 'calculates the Sulphurus item correctly' do
      items = [Item.new('Sulfuras, Hand of Ragnaros', 0, 80)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 80
      
    end
    
    it 'calculates the Aged Brie item correctly' do
      items = [Item.new('Aged Brie', 4, 8)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 9
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 10
      
    end
    
    it 'calculates the Elixir of the Mongoose item correctly' do
      items = [Item.new('Elixir of the Mongoose', 5, 7)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 6
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 5
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 4
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 3
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 2
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq -1
      expect(items[0].quality).to eq 0
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 0
      
    end
    
    it 'calculates the Backstage passes to a TAFKAL80ETC concert item correctly' do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 12, 20)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 11
      expect(items[0].quality).to eq 21
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 10
      expect(items[0].quality).to eq 22
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 9
      expect(items[0].quality).to eq 24
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 8
      expect(items[0].quality).to eq 26
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 7
      expect(items[0].quality).to eq 28
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 6
      expect(items[0].quality).to eq 30
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 5
      expect(items[0].quality).to eq 32
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 4
      expect(items[0].quality).to eq 35
      
    end
    
    it 'calculates the Conjured Mana Cake item correctly' do
      items = [Item.new('Conjured Mana Cake', 3, 15)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 2
      expect(items[0].quality).to eq 13
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 1
      expect(items[0].quality).to eq 11
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 0
      expect(items[0].quality).to eq 9
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq -1
      expect(items[0].quality).to eq 5
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq -2
      expect(items[0].quality).to eq 1
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq -3
      expect(items[0].quality).to eq 0
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq -4
      expect(items[0].quality).to eq 0
      
    end
  end
end
