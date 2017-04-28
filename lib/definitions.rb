class Word
  @@all_words = []
  attr_accessor(:name, :img, :def, :id)

  define_method(:initialize) do |attrib|
    @name = attrib[:name]
    @img = attrib[:img]
    @def = []
    @id = @@all_words.length+1
    @@all_words.push(self)
  end
  define_singleton_method(:all) do
    @@all_words
  end
  define_singleton_method(:clear) do
    @@all_words = []
  end
  define_method(:add_def) do |new_def|
    @def.push(new_def)
  end
end

class Definition
  @@all_defs = []
  attr_accessor(:text, :id)

  define_method(:initialize) do |attrib|
    @text = attrib[:text]
    @id = @@all_defs.length+1
    @@all_defs.push(self)
  end
  define_singleton_method(:all) do
    @@all_defs
  end
  define_singleton_method(:clear) do
    @@all_defs = []
  end
end
