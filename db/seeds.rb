question1 = Question.create!({body: "At what age did you have your first child?", id: 1})
question1.choices.create!([{body: "<18yrs"}, {body: "18-20yrs"}, {body: "20-25yrs"}, {body: "25-30yrs"}, {body: "30+yrs"}, {body: "I have no children."}])

question2 = Question.create!({body: "What is your gender?", id: 2})
question2.choices.create!([{body: "Cis Male"}, {body: "Cis Female"}, {body: "Trans Male"}, {body: "Trans Female"}, {body: "Other"}])
														
question3 = Question.create!({body: "For the majority of your childhood, did you grow up in a single-parent household?", id: 3})
question3.choices.create!([{body: "No, both parents were present, in one home or with equal custody."}, {body: "Yes, and I lived with my mother."}, {body: "Yes, and I lived with my father."}, {body: "Other."}])

question4 = Question.create!({body: "Are you familiar with the term \"Social Justice\"?", id: 4})
question4.choices.create!([{body: "Yes, and I actively support the movement."}, {body: "Yes, and I don't care strongly about it."}, {body: "Yes, and I am actively against the movement."}, {body: "No."}, {body: "Other."}])

question5 = Question.create!({body: "Do you speak a non-English language?", id: 5})
question5.choices.create!([{body: "Yes, natively"}, {body: "Yes, fluently"}, {body: "No"}])

question6 = Question.create!({body: "Are you currently in or pursuing a relationship? Do you identify more as male or female?", id: 6})
question6.choices.create!([{body: "Female. Yes, I am in a relationship or want to be."},
													 {body: "Male. Yes, I am in a relationship or want to be."},
													 {body: "Female. No, and I am not interested in being in a relationship at this time."},
													 {body: "Male. No, and I am not interested in being in a relationship at this time."}])

question7 = Question.create!({body: "How many partners have you had in your lifetime?", id: 7})
question7.choices.create!([{body: "1"}, {body: "2"}, {body: "3-5"}, {body: "6-10"}, {body: "11-20"}, {body: "20+"}])

question8 = Question.create!({body: "Have you ever been paid to write code, either through a stipend or in industry?", id: 8})
question8.choices.create!([{body: "Yes"}, {body: "No"}])

question9 = Question.create!({body: "Do you have a degree or a job in a STEM field?", id: 9})
question9.choices.create!([{body: "Yes"}, {body: "No"}])