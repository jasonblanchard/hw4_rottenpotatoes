Given /^the following movies exist:$/ do |table|
  table.hashes.each do |movie|
    Movie.create( :title => movie[:title], :rating => movie[:rating], :director => movie[:director], :release_date => movie[:release_date] )
  end
end

Then /^the director of "([^"]*)" should be "([^"]*)"$/ do |arg1, arg2|
  assert_equal(Movie.find_by_title(arg1).director, arg2)
end

