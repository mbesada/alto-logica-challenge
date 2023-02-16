require_relative '../src/product_parser'

describe ProductParser do
  describe 'parse' do
    let(:parser) do
      described_class.new
    end

    describe 'Parsing a Book' do
      # input 2 book at 12.49
      # output 2 book: 24.98
      let(:parsed) do
        parser.parse('2 book at 12.49')
      end

      it 'Has no taxes' do
        expect(parsed.tax).to eq(0)
      end

      it 'Has the right price' do
        expect(parsed.end_price).to eq(24.98)
      end

      it 'Has the right description' do
        expect(parsed.description).to eq('book')
      end

      it 'Returns the right final product' do
        expect(parsed.to_s).to eq('2 book: 24.98')
      end
    end

    describe 'Parsing a regular item' do
      # input 1 music CD at 14.99
      # output 1 music CD: 16.49

      let(:parsed) do
        parser.parse('1 music CD at 14.99')
      end

      it 'Has 10% taxe' do
        expect(parsed.tax).to eq(0.10)
      end

      it 'Has the right price' do
        expect(parsed.end_price).to eq(16.49)
      end

      it 'Has the right description' do
        expect(parsed.description).to eq('music CD')
      end

      it 'Returns the right final product' do
        expect(parsed.to_s).to eq('1 music CD: 16.49')
      end
    end

    describe 'Parsing an imported item tax excempt' do
      # input 3 imported boxes of chocolates at 11.25
      # output 3 imported box of chocolates: 35.55

      let(:parsed) do
        parser.parse('3 imported boxes of chocolates at 11.25')
      end

      it 'Has 10% taxe' do
        expect(parsed.tax).to eq(0.05)
      end

      it 'Has the right price' do
        expect(parsed.end_price).to eq(35.55)
      end

      it 'Has the right description' do
        expect(parsed.description).to eq('imported box of chocolates')
      end

      it 'Returns the right final product' do
        expect(parsed.to_s).to eq('3 imported box of chocolates: 35.55')
      end
    end

    describe 'Parsing an imported item' do
      # input 1 imported bottle of perfume at 47.50
      # output 1 imported bottle of perfume: 54.65
      let(:parsed) do
        parser.parse('1 imported bottle of perfume at 47.50')
      end

      it 'Has 15% taxe' do
        expect(parsed.tax).to be_within(0.01).of(0.15)
      end

      it 'Has the right price' do
        expect(parsed.end_price).to eq(54.65)
      end

      it 'Has the right description' do
        expect(parsed.description).to eq('imported bottle of perfume')
      end

      it 'Returns the right final product' do
        expect(parsed.to_s).to eq('1 imported bottle of perfume: 54.65')
      end
    end
  end
end
