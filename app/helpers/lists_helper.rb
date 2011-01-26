module ListsHelper
  def meanings_of_word_on_a_list(word_meanings, list_meanings)
    meanings = []
    for meaning in word_meanings
      meanings << meaning if list_meanings.include?(meaning)
    end
    meanings
  end
end
