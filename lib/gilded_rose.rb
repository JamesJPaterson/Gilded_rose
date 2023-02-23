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
          item.quality += 1
          item.quality += 1 if item.name == 'Backstage passes to a TAFKAL80ETC concert' and item.sell_in < 11
          item.quality += 1 if item.name == 'Backstage passes to a TAFKAL80ETC concert' and item.sell_in < 6
          item.quality = 0 if item.name == 'Backstage passes to a TAFKAL80ETC concert' and item.sell_in < 1
        end
      end
      item.sell_in -= 1 unless item.name == 'Sulfuras, Hand of Ragnaros'
      if item.quality < 0
        item.quality = 0
      elsif item.quality > 50
        item.quality = 50
      end
    end
  end
end



  # def update_normal_quality
    # @items.each do |item|
  #   # Now I'm filtering out all special and conjured items
  #   if item.quality > 0 && item.name != "Aged Brie" && item.name != "Backstage passes to a TAFKAL80ETC concert" && item.name != "Sulfuras, Hand of Ragnaros"
  #     item.quality = item.quality -1
  #     # Now I'm testing to see if the item is out of date and if so I'm further reducing it's quality
  #     if item.quality > 1 and item.sell_in < 0
  #       item.quality -= 1
  #     end
  #     item.sell_in -= 1 
  #   end
  #   end
  # end

 # def update_conjured_quality()
  #   @items.each do |item|
  #     # Here I have made several if statements to reduce the value of conjured items based on their sell_in 
  #     if item.name.include?("conjured")
  #       if item.quality > 3 && item.sell_in < 0
  #         item.quality = item.quality - 4
  #       elsif item.quality < 5 && item.sell_in < 0
  #         item.quality = 0
  #       elsif item.quality > 1 && item.sell_in > 0
  #         item.quality = item.quality - 2
  #       elsif item.quality == 1
  #         item.quality = item.quality - 1
  #       end
  #     item.sell_in = item.sell_in - 1
  #     end
  #   end
  # end

  # def update_special_quality()
  #   @items.each do |item|
  #     # Here I'm making sure that the value does not go over the max amount
  #     if item.quality < 50
  #       # Here I'm filtering the special items by name to make sure that each of them follow their specific rules
  #       if item.name == "Aged Brie"
  #         item.quality = item.quality + 1
  #         item.sell_in = item.sell_in - 1
  #       elsif item.name == "Backstage passes to a TAFKAL80ETC concert"
  #         if item.sell_in < 10 && item.sell_in > -1 
  #           item.quality = item.quality +2
  #         elsif item.sell_in < 5 && item.sell_in > -1 
  #           item.quality = item.quality +3
  #         elsif item.sell < 0
  #           item.quality = 0
  #         else
  #           item.quality = item.quality + 1
  #         end
  #         item.sell_in = item.sell_in - 1
  #       elsif item.name == "Sulfuras, Hand of Ragnaros"
  #       end
  #     end
  #   end
  # end













# def update_quality()
#   @items.each do |item|
#     if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
#       if item.quality > 0
#         if item.name != "Sulfuras, Hand of Ragnaros"
#           item.quality = item.quality - 1
#         end
#       end
#     else
#       if item.quality < 50
#         item.quality = item.quality + 1
#         if item.name == "Backstage passes to a TAFKAL80ETC concert"
#           if item.sell_in < 11
#             if item.quality < 50
#               item.quality = item.quality + 1
#             end
#           end
#           if item.sell_in < 6
#             if item.quality < 50
#               item.quality = item.quality + 1
#             end
#           end
#         end
#       end
#     end
#     if item.name != "Sulfuras, Hand of Ragnaros"
#       item.sell_in = item.sell_in - 1
#     end
#     if item.sell_in < 0
#       if item.name != "Aged Brie"
#         if item.name != "Backstage passes to a TAFKAL80ETC concert"
#           if item.quality > 0
#             if item.name != "Sulfuras, Hand of Ragnaros"
#               item.quality = item.quality - 1
#             end
#           end
#         else
#           item.quality = item.quality - item.quality
#         end
#       else
#         if item.quality < 50
#           item.quality = item.quality + 1
#         end
#       end
#     end
#   end
# end