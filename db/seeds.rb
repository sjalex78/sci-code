# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# create 3 users
[
  'sci@poster.com',
  'teacher@poster.com',
  'poster@sci.com',
].each do |email|
  user_uuid = Digest::UUID.uuid_v5(Digest::UUID::DNS_NAMESPACE, email)
  args = { id: user_uuid, email: email }
  optional_args = {}
  user = User.find_by(**args)
  default_user_args = {
    password: 'password',
    password_confirmation: 'password',
  }
  User.create!(**default_user_args.merge(args).merge(optional_args)) unless user
end

sci_poster_user = User.find(Digest::UUID.uuid_v5(Digest::UUID::DNS_NAMESPACE, 'sci@poster.com'))
teacher_user = User.find(Digest::UUID.uuid_v5(Digest::UUID::DNS_NAMESPACE, 'teacher@poster.com'))
poster_user = User.find(Digest::UUID.uuid_v5(Digest::UUID::DNS_NAMESPACE, 'poster@sci.com'))

# sci@poster.com has a poster with others as contributors
poster1 = Poster.find_by(
  id: Digest::UUID.uuid_v5(Digest::UUID::DNS_NAMESPACE, 'poster1.sci@poster.com'),
)
poster1 ||= Poster.create!(
  id: Digest::UUID.uuid_v5(Digest::UUID::DNS_NAMESPACE, 'poster1.sci@poster.com'),
  user: sci_poster_user,
)
poster1.update!(
  title: 'Poster 1',
)
unless poster1.contributors.exists?(user: sci_poster_user, role: :owner)
  poster1.contributors << Contributor.new(user: sci_poster_user, role: :owner)
end
unless poster1.contributors.exists?(user: teacher_user, role: :teacher)
  poster1.contributors << Contributor.new(user: teacher_user, role: :teacher)
end
unless poster1.contributors.exists?(user: poster_user, role: :editor)
  poster1.contributors << Contributor.new(user: poster_user, role: :editor)
end

def find_or_create_component_for_poster(poster:, id_namespace:, data:)
  uuid = Digest::UUID.uuid_v5(Digest::UUID::DNS_NAMESPACE, id_namespace)
  component = Component.find_by(id: uuid)
  component ||= Component.create!(id: uuid, poster_id: poster.id)
  component.update!(data: (component.data || {}).merge(data))
end

# with the following components
find_or_create_component_for_poster(
  poster: poster1,
  id_namespace: 'poster1.title.sci@poster.com',
  data: {
    type: 'title',
    text: 'The poster title should be written as a question that briefly conveys ' \
          'the interesting issue, the general experimental approach, and the system.',
    reference: 'Advice for teachers - biology. Victorian Curriculum And ' \
               'Assessment Authority. (n.d.). Retrieved March 3, 2022, from ' \
               'https://www.vcaa.vic.edu.au/curriculum/vce/vce-study-designs/biology/advice-for-teachers/Pages/ScientificPosterSections.aspx',
  },
)

find_or_create_component_for_poster(
  poster: poster1,
  id_namespace: 'poster1.abstract.sci@poster.com',
  data: {
    type: 'abstract',
    text: <<~EO_TEXT,
      Your abstract (maximum of 250 words) may be incorporated within your
      poster or attached to your posted and should include the following
      information about your research project: What was studied?
      How was it studied?, What were the results?, An explanation of those
      results. Your abstract should be clear and concise. Avoid abbreviations
      and jargon. Do not put your name or school information in the body of the
      abstract. Do not include the title in the body of the abstract.
    EO_TEXT
    reference: <<~EO_TEXT,
      High School Research Symposium abstract, poster, and judging
      information. High School Research Symposium Abstract, Poster, and Judging
      Information | Center for Mathematics, Science, and Technology - Illinois
      State. (2022, January 11). Retrieved March 3, 2022, from
      https://cemast.illinoisstate.edu/students/high-school/research-symposium/abstract-posterrules/
    EO_TEXT
  },
)

# component_2_uuid = Digest::UUID.uuid_v5(Digest::UUID::DNS_NAMESPACE, "abstract_sci@poster.com")
# Component.create(abstract:{ text: "Your abstract (maximum of 250 words) may be
# incorporated within your poster or attached to your posted and should include
# the following information about your research project: What was studied?
# How was it studied?, What were the results?, An explanation of those results.
# Your abstract should be clear and concise. Avoid abbreviations and jargon. Do
# not put your name or school information in the body of the abstract. Do not
# include the title in the body of the abstract.", reference: "High School
# Research Symposium abstract, poster, and judging information. High School
# Research Symposium Abstract, Poster, and Judging Information | Center for
# Mathematics, Science, and Technology - Illinois State. (2022, January 11).
# Retrieved March 3, 2022, from
# https://cemast.illinoisstate.edu/students/high-school/research-symposium/abstract-posterrules/"})

# # component_3_uuid = Digest::UUID.uuid_v5(Digest::UUID::DNS_NAMESPACE, "introduction_sci@poster.com")
# #Component.create(introduction:{ text: "Introduction Present a general
# overview of what your poster will include. Provide background information
# necessary to understand the topic. You may also include the research you used
# to begin your experiment. Explain why you have selected the topic.",
# reference: "High School Research Symposium abstract, poster, and judging
# information. High School Research Symposium Abstract, Poster, and Judging
# Information | Center for Mathematics, Science, and Technology - Illinois
# State. (2022, January 11). Retrieved March 3, 2022, from
# https://cemast.illinoisstate.edu/students/high-school/research-symposium/abstract-posterrules/"})

# # component_4_uuid = Digest::UUID.uuid_v5(Digest::UUID::DNS_NAMESPACE, "method_sci@poster.com")
# #Component.create(method: {text: "Briefly describe the methods and materials
# used in your research. How did you collect your data? How often?", image_1:
# "", image_2: ""})

# # component_5_uuid = Digest::UUID.uuid_v5(Digest::UUID::DNS_NAMESPACE, "hypothesis_sci@poster.com")
# #Component.create(hypothesis: {text: "IF independent variable THEN dependent
# variable BECAUSE ...."})

# component_6_uuid = Digest::UUID.uuid_v5(Digest::UUID::DNS_NAMESPACE, "discussion_sci@poster.com")
# #Component.create(discussion: {text: "Present and describe the data.
# Highlight the "big picture" of the experiment. Use figures (e.g., maps,
# diagrams, or photographs) and tables. All figures and tables need to be
# numbered and have a caption. You need to refer to each figure and table in
# the text of the poster.", image_1: "", image_2: ""})

# # component_7_uuid = Digest::UUID.uuid_v5(Digest::UUID::DNS_NAMESPACE, "conclusion_sci@poster.com")
# #Component.create(conclusion: {text: "Restate the hypothesis and whether or
# not it was supported. Summarize the research results and provide an
# explanation for why these results may have occurred.Do not include any "new"
# information in this section."})

# # component_8_uuid = Digest::UUID.uuid_v5(Digest::UUID::DNS_NAMESPACE, "references_sci@poster.com")
{
  type: 'references',
  text: "Anything included in your poster that is not your own, including text,
  figures, and/or tables, must be referenced. You may use in-text citations or
  footnotes throughout your poster.Please use either MLA or APA style for the
  reference list.",
}
