class YayScore
	NoScore = Class.new

	def self.for_term(term)
		positive = SearchEngine.count_results("#{term} yay").to_f
		negative = SearchEngine.count_results("#{term} nay").to_f
		score = 10 * positive / (positive + negative)
		score.nan? ? NoScore : score
	end
end