# Add a declarative step here for populating the DB with movies.


Given /the following movies exist/ do |movies_table|
# Given("the following movies exist:") do |table|
  movies_table.hashes.each do |movie|
    Movie.create(movie)
  end
#   count = page.all("#movies.table.table-striped.col-md-12 tr").size 
#   count -= 1 #to eliminate the title row
#   expect(count ).to eq Movie.all.length
end

# And visit "/bars"



Then /(.*) seed movies should exist/ do | n_seeds |
  Movie.count.should be n_seeds.to_i
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
    expect(page.body.index(e1)  < page.body.index(e2)  ).to eq true
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb

    rating_list.split(",").each{ |rating|
        if uncheck
            uncheck("ratings_#{rating.strip}")
        else
            check("ratings_#{rating.strip}")
        end
    }
end

Then /I should see all the movies/ do
  # Make sure that all the movies in the app are visible in the table
        count = page.all("#movies.table.table-striped.col-md-12 tr").size 
        count -= 1 #to eliminate the title row
        expect(count ).to eq Movie.all.length
end


