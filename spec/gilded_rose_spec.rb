require 'gilded_rose'

RSpec.describe GildedRose do
  describe "#update_quality" do
    it "degrades the quality of normal items by 1" do
      items = [Item.new("foo", 10, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(9)
      expect(items[0].sell_in).to eq(9)
    end

    it "degrades the quality of normal items twice as fast after sell-in date" do
      items = [Item.new("foo", -1, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(8)
    end

    it "never degrades the quality of an item below 0" do
      items = [Item.new("foo", 10, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(0)
    end

    it "increases the quality of Aged Brie" do
      items = [Item.new("Aged Brie", 10, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(11)
    end

    it "never increases the quality of an item above 50" do
      items = [Item.new("Aged Brie", 10, 50)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(50)
    end

    it "never changes the quality of Sulfuras" do
      items = [Item.new("Sulfuras, Hand of Ragnaros", 10, 80)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(50)
    end

    it "increases the quality of Backstage passes by 1 when there are more than 10 days left" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(11)
    end

    it "increases the quality of Backstage passes by 2 when there are 6 to 10 days left" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(12)
    end

    it "increases the quality of Backstage passes by 3 when there are 5 days or less left" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(13)
    end

    it "drops the quality of Backstage passes to 0 after the concert" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(0)
    end

    it "reduces the quality of conjured items by 2 each day before sell_in" do
      items = [Item.new("Conjured Cake", 5, 10)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq(8)
    end
    
    it "reduces the quality of conjured items by 4 each day after sell_in" do
      items = [Item.new("Conjured Cake", 0, 10)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq(6)
    end
    
    it "never reduces the quality of conjured items below 0" do
      items = [Item.new("Conjured Cake", 5, 1)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq(0)
    end
  end
end