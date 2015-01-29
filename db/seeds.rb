question2 = Question.create!({body: "At what age did you have your first child?"})
question2.choices.create!({body: "<18yrs"}, {body: "18-20yrs"}, {body: "20-25yrs"}, {body: "25-30yrs"}, {body: "30+yrs"}, {body: "I have no children."})

question4 = Question.create!({body: "For the majority of your childhood, did you grow up in a single-parent household?"})
question4.choices.create!({body: "No, both parents were present."}, {body: "Yes, and I lived with my mother."}, {body: "Yes, and I lived with my father."}, {body: "Other."})

question10 = Question.create!({body: "At what age did you marry your first spouse?"})
question10.choices.create!({body: "<18yrs"}, {body: "18-20yrs"}, {body: "20-25yrs"}, {body: "25-30yrs"}, {body: "30+yrs"}, {body: "I have not married."})

question11 = Question.create!({body: "Do you value tradition?"})
question11.choices.create!([{body: "Yes, very much so."}, {body: "Yes, in some cases."}, {body: "No."}])

question3 = Question.create!({body: "What gender do you identify with?"})
question3.choices.create!({body: "Male"}, {body: "Female"}, {body: "Other"})

question15 = Question.create!({body: "Do you have a degree from a 4-year institution?"})
question15.choices.create!([{body: "Yes"}, {body: "No"}])

question16 = Question.create!({body: "Do you have a high school diploma (not a GED)?"})
question16.choices.create!([{body: "Yes"}, {body: "No"}])

question14 = Question.create!({body: "If there were no punishment for theft, would you steal nice things you want but don't need?"})
question14.choices.create!([{body: "Yes"}, {body: "No"}])

question5 = Question.create!({body: "Do you speak a non-English language?"})
question5.choices.create!([{body: "Yes, natively"}, {body: "Yes, at least conversationally"}, {body: "No"}])

question1 = Question.create!({body: "Are you familiar with the term \"Social Justice\"?"})
question1.choices.create!([{body: "Yes, and I actively support the movement."}, {body: "Yes, and I don't care about it."}, {body: "Yes, and I am actively against the movement."}, {body: "No."}, {body: "Other."}])

question6 = Question.create!({body: "If you identify more as male than female: Are you currently in or pursuing a relationship?"})
question6.choices.create!([{body: "Yes, I am in a relationship or want to be."},
													 {body: "No, and I am not interested in being in a relationship at this time."}]

question7 = Question.create!({body: "If you identify more as female than male: Are you currently in or pursing a relationship?"})
question7.choices.create!([{body: "Yes, I am in a relationship or want to be."},
													 {body: "No, and I am not interested in being in a relationship at this time."}]

question8 = Question.create!({body: "What is your sexual orientation?"})
question8.choices.create!([{body: "Heterosexual"}, {body: "Homosexual"}, {body: "Bisexual"}, {body: "Other"}])

question9 = Question.create!({body: "Do you consider yourself introverted or extroverted?"})
question9.choices.create!([{body: "Introverted"}, {body: "Extroverted"}])

question9 = Question.create!({body: "Have you ever been diagnosed with a mental disorder?"})
question9.choices.create!([{body: "Yes, and I consider myself to still suffer from it."}, {body: "Yes, but I have recovered."}, {body: "No."}])

question12 = Question.create!({body: "Do you find sexism to be a cogent concept?"})
question12.choices.create!([{body: "Yes"}, {body: "No"}])

question13 = Question.create!({body: "Do you find racism to be a cogent concept?"})
question13.choices.create!([{body: "Yes"}, {body: "No"}])

question14 = Question.create!({body: "Have you ever smoked marijuana?"})
question14.choices.create!([{body: "Yes"}, {body: "No"}])

question17 = Question.create!({body: "If you are married: Do you argue with your spouse more often than you would like?"})
question17.choices.create!([{body: "Yes"}, {body: "No"}])

question22 = Question.create!({body: "If you are married: Do you have enough sex?"})
question22.choices.create!([{body: "Yes"}, {body: "No"}])

question18 = Question.create!({body: "Do you subscribe primarily to virtue ethics, consequentialism, or deontology?"})
question18.choices.create!([{body: "Virtue ethics"}, {body: "Consequentialism"}, {body: "Deontology"}, {body: "Unsure or unfamiliar with the terms"}])

question19 = Question.create!({body: "Do you feel safe going outdoors at night?"})
question19.choices.create!([{body: "Yes"}, {body: "No"}])

question20 = Question.create!({body: "Do you like your job?"})
question20.choices.create!([{body: "Yes"}, {body: "No"}])

question21 = Question.create!({body: "Do you feel oppressed?"})
question21.choices.create!([{body: "Yes"}, {body: "No"}])

question23 = Question.create!({body: "Do you think of Jews as white?"})
question23.choices.create!([{body: "Yes"}, {body: "No"}])

question23 = Question.create!({body: "What is the minimum annual income for an individual you would consider middle-class in your area?"})
question23.choices.create!([{body: "<$10k"}, {body: "$10-20k"}, {body: "$20-30k"}, {body: "$30-40k"}, {body: "$40-50k"}, {body: "$50-60k"}, {body: "$60-70k"}, {body: "$70-80k"}, {body: ">$80k"}])

question24 = Question.create!({body: "Have you outlived anyone in your immediate family?"})
question24.choices.create!([{body: "Yes"}, {body: "No"}])

question25 = Question.create!({body: "Do you regularly eat meals at a table with your family?"})
question25.choices.create!([{body: "Yes"}, {body: "No"}])

question26 = Question.create!({body: "If you have children: Is the biological mother/father of your child out of the picture?"})
question26.choices.create!([{body: "Yes"}, {body: "No"}])

Question.all.each do |q|
	q.is_approved = true
	q.save!
end