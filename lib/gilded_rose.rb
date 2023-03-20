require 'items'

class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      # Now I'm filtering out all special and conjured items
      if item.name != 'Aged Brie' && item.name != 'Backstage passes to a TAFKAL80ETC concert' && item.name != 'Sulfuras, Hand of Ragnaros'
        # Here I'm degrading the value of each item and double if it's conjured
        if item.quality > 0
          item.quality -= 1
          item.quality -= 1 if item.name.include?('Conjured')
        end
        # Here I'm degrading the value of each item again due to it being spoiled and double if it's conjured
        if item.sell_in < 1
          if item.quality > 0
            item.quality -= 1
            item.quality -= 1 if item.name.include?('Conjured')
          end
        end
      else
        if item.quality < 50
          # Making sure that the item.quality does not go above the maximum of 50 and adding the increased value for the two different special items
          item.quality += 1
          item.quality += 1 if item.name == 'Backstage passes to a TAFKAL80ETC concert' and item.sell_in < 11
          item.quality += 1 if item.name == 'Backstage passes to a TAFKAL80ETC concert' and item.sell_in < 6
          item.quality = 0 if item.name == 'Backstage passes to a TAFKAL80ETC concert' and item.sell_in < 1
        end
      end
      # Changing the sell.in value unless it is the Legendary Sulfuras item
      item.sell_in -= 1 unless item.name == 'Sulfuras, Hand of Ragnaros'
      if item.quality < 0
        item.quality = 0
      elsif item.quality > 50
        item.quality = 50
      end
    end
  end
end