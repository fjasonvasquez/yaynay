When /^I search for (.*)$/ do |term|
	@scores ||= {}
	@scores [term] = YayScore.for_term(term)
end

Then /^apple should have a higher score than microsoft$/ do
	@scores["yay"].should be > @scores["nay"]
	end