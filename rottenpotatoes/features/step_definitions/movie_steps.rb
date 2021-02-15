# Add a declarative step here for populating the DB with movies.


# user = User.create(name: "David", occupation: "Code Artist")
puts "testing"

Given /the following movies exist/ do |movies_table|
# Given("the following movies exist:") do |table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
#     user = CreateMovies.create(
#         title: "Aladdin", 
#         rating: "G",
#         description: "Code Artist",
#         release_date: "25-Nov-1992"
#     )
#       user = Movies.create(
#         title: "Aladdin", 
#         rating: "G",
#         description: "Code Artist",
#         release_date: "25-Nov-1992"
#     )
    Movie.create(movie)
     # you should arrange to add that movie to the database here.
#       puts movie
  end
#   fail "Unimplemented"
end

# And visit "/bars"



Then /(.*) seed movies should exist/ do | n_seeds |
  Movie.count.should be n_seeds.to_i
#     10
#     11
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
#     log page.body.index(e1) 
#     log page.body.index(e2) 
#     log page.body.index(e1)  < page.body.index(e2) 
    expect(page.body.index(e1)  < page.body.index(e2)  ).to eq true
#   assert page.body.index(e1) < page.body.index(e2)
#   fail "Unimplemented"
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
#   puts uncheck
#     puts rating_list
#    log(uncheck)
    rating_list.split(",").each{ |rating|
        if uncheck
#             log "hi"
            uncheck("ratings_#{rating.strip}")
        else
#             log "bye"
            check("ratings_#{rating.strip}")
            
        end
    }
#   fail "Unimplemented"
end

Then /I should see all the movies/ do
  # Make sure that all the movies in the app are visible in the table
#     rowCount = 0
            count = page.all("#movies.table.table-striped.col-md-12 tr").size 
        count -= 1 #to eliminate the ti
#         expect(movie).to eq movie["title"]
        expect(count ).to eq Movie.all.length
#     Movie.all.each{|movie|
        #movies.table.table-striped.col-md-12
#         page.should have_css "#movies.table.table-striped.col-md-12", :count => number_of_rows.to_i

        
        
#         page.should have_content(movie["title"])
#     }
#   fail "Unimplemented"
end


# Given("I am on the RottenPotatoes home page") do
#     visit "/"
# #   pending 
#     # Write code here that turns the phrase above into concrete actions
# end
