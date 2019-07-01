class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      
      case item.name
      when 'Aged Brie'
        if item.quality < 50
          item.quality = item.quality + 1
        end
        
      when 'Backstage passes to a TAFKAL80ETC concert'
        if item.sell_in > 10
          if item.quality < 50
            item.quality = item.quality + 1
          end
        end
        if item.sell_in <= 10 && item.sell_in > 5
          if item.quality < 50
            #check if the quality becomes more than 50 if we add 2 to it, if yes
            #then make the quality as 50 otherwise add 2 to it.
            item.quality = ((item.quality + 2) > 50) ? 50 : (item.quality + 2)
          end
        end
        if item.sell_in <= 5
          if item.quality < 50
            #check if the quality becomes more than 50 if we add 3 to it, if yes
            #then make the quality as 50 otherwise add 3 to it.
            item.quality = ((item.quality + 3) > 50) ? 50 : (item.quality + 3)
          end
        end
        #if sell_in is less than = 0 then make the quality 0
        if item.sell_in <= 0
          item.quality = 0
        end
        
      when 'Conjured Mana Cake'
        if item.quality > 0
          #its not clear from specification that how Conjure item will degrade
          #after sell_in is less than 0
          #assuming that its double than the normal items, i.e. decreases by 4
          #once sell_in is less than 0
          if item.sell_in <= 0
            item.quality = ((item.quality - 4) > 0) ? (item.quality - 4) : 0
          else
            item.quality = ((item.quality - 2) > 0) ? (item.quality - 2) : 0
          end
          
        end
      
      when 'Sulfuras, Hand of Ragnaros'
        #nothing happens.
        
      else
        if item.quality > 0
          if item.sell_in <= 0
            item.quality = item.quality - 2
          else
            item.quality = item.quality - 1
          end
          
        end
      end
      
      item.sell_in = item.sell_in - 1 unless item.name == "Sulfuras, Hand of Ragnaros"
    end
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
