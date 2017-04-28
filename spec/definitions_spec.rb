require('rspec')
require('definitions')

describe('Word') do
  before() do
    Word.clear
  end

  describe('#initialize') do
    it('Creates a new Word object based on provided attributes') do
      test_word = Word.new({
        :name => 'Test',
        :img => ""
        })
      expect(test_word.name).to(eq('Test'))
      expect(test_word.img).to(eq(''))
      expect(test_word.def).to(eq([]))
      expect(test_word.id).to(eq(1))
    end
  end

  describe('#add_def') do
    it('Adds Definition objects to the @def array for Word objects') do
      test_word = Word.new({
        :name => 'Test',
        :img => ""
        })
      test_def = Definition.new({:text => 'testtest'})
      test_word.add_def(test_def)
      expect(test_word.def).to(eq([test_def]))
    end
  end

  describe('.all') do
    it('Returns the @@all_words class variable, an array of all word objects') do
      test_word = Word.new({})
      test_word2 = Word.new({})
      expect(Word.all).to(eq([test_word,test_word2]))
    end
  end

  describe('.clear') do
    it('Empties the @@all_words class variable array') do
      test_word = Word.new({})
      test_word2 = Word.new({})
      expect(Word.clear).to(eq([]))
    end
  end

  describe('.find') do
    it('Searches through the @@all_words array for a Word object with a matching id to the passed arg') do
      test_word = Word.new({})
      test_word2 = Word.new({})
      expect(Word.find(2)).to(eq(test_word2))
    end
  end
end

describe('Definition') do
  before() do
    Definition.clear
  end

  describe('#initialize') do
    it('Creates a new Definition object based on provided attributes') do
      test_def = Definition.new({
        :text => 'TestTest',
        })
      expect(test_def.text).to(eq('TestTest'))
      expect(test_def.id).to(eq(1))
    end
  end
end
