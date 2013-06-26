require File.join(File.dirname(__FILE__), 'gilded_rose')

describe GildedRose do

  def create_items(name, sell_in, quality)
    [Item.new(name, sell_in, quality)]
  end

  describe "#update_quality" do
    @names = ['Aged Brie', 'Backstage passes to a TAFKAL80ETC concert', 'Sulfuras, Hand of Ragnaros']


    @names.each do |name|
      it "does not change the name" do
        items = create_items("foo", 0, 0)
        GildedRose.new(items).update_quality()
        items[0].name.should == "foo"
      end

      context "the name is '#{name}'" do

        context "the sell_in is less than 6" do

          before { @items = create_items(name, sell_in, quality) }

          let(:sell_in) { 0 }

          context "the quality is 0" do
            let(:quality) { 0 }

            it "increaes quality by 2" do
              GildedRose.new(@items).update_quality()
              @items[0].quality.should == quality + 2
            end

            it "decreases sell in by 1" do
              GildedRose.new(@items).update_quality()

              @items[0].sell_in.should == sell_in - 1
            end


          end

          context "the quality is greater than 0 and less than 50" do
            let(:quality) { 2 }

            it "it increases quality by 2" do
              GildedRose.new(@items).update_quality()
              @items[0].quality.should == quality + 2
            end

            it "decreases sell in by 1" do
              GildedRose.new(@items).update_quality()
              @items[0].sell_in.should == sell_in - 1
            end

          end

          context "quality is 49" do
            let(:quality) { 49 }
            it "increases quality by 1" do
              GildedRose.new(@items).update_quality()
              @items[0].quality.should == quality + 1
            end

            it "decreases sell by 1" do
              GildedRose.new(@items).update_quality()
              @items[0].sell_in.should == sell_in - 1
            end

          end


          context "the quality is equal or greater than 50" do
            let(:quality) { 50 }

            it "does not change quality " do
              GildedRose.new(@items).update_quality()
              @items[0].quality.should == quality
            end


            it "decreases sell by 1" do
              GildedRose.new(@items).update_quality()
              @items[0].sell_in.should == sell_in - 1
            end
          end
        end
      end

      context "the sell_in is less than 11" do

        context "the quality is greater than 0" do
          context "the quality is less than 50" do

          end
          context "the quality is greater than 50" do

          end
        end
      end
      context "the sell_in is 11 or greater" do

        context "the quality is greater than 0" do
          context "the quality is less than 50" do

          end
          context "the quality is greater than 50" do

          end
        end
      end
    end
  end


end
