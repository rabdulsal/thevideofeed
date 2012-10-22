module PeopleHelper
  def people_list
    Person.all.sort_by(&:name).map do |person|
      link_to(h(person), person)
    end.to_sentence(words_connector: " | ", last_word_connector: " | ").html_safe
  end
end
