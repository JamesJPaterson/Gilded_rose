# Gilded_rose
Gilded_rose - Individual Challenge

Installing software

I copied the initially class file over to a blank folder, I then used these lines of code to install all of my prerequisite software
To make sure I was using the latest version of ruby - rvm use ruby --latest -–install --default
To generate a gemfile - bundle init
To add an rspec folder and file - bundle add rspecrspec and then rspec --init

Writing the code

I had several different inital Ideas for how to handle the issue

First I tried to write aa working code similar to the one presented but slightly more efficient, not to fullfil the the assignment but to better understand how the program worked and how the different parts would interact. 

Then I proceeded to write a considerable amount of the tests for it to make sure that when I did edit the code it would still pass and work properly. 

I then proceeded to see what would be the best way of getting it to work via a three method program; update_normal_quality,  update_conjured_quality and update_special_quality. This was to test to see if it would be better to make a three class program but I couldn't get it to work via that way, especially when interacting with the tests.

Here I came to a crossroads whether to go off and spend a lot of time figuring out the issue but instead decided to see if I could make a short method without too many lines and creating and if/else hellscape.

I managed to update the normal/conjured items in the same part of the method with a simple 'item.quality -= 1 if item.name.include?('Conjured')' which would add on the additional detrimental effects of conjured items without much change. 

I then managed to do all of the special items in a couple lines of code here by adding additional value if the prequisites matched

        item.quality += 1
        item.quality += 1 if item.name == 'Backstage passes to a TAFKAL80ETC concert' and item.sell_in < 11
        item.quality += 1 if item.name == 'Backstage passes to a TAFKAL80ETC concert' and item.sell_in < 6
        item.quality = 0 if item.name == 'Backstage passes to a TAFKAL80ETC concert' and item.sell_in < 1

After that all that was left was making sure that the sulfuras was not changed