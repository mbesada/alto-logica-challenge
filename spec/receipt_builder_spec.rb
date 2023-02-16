require_relative '../src/receipt_builder'

describe ReceiptBuilder do
  describe 'Receipt builder' do
    let(:builder) do
      described_class.new
    end

    describe 'First example' do
      let(:products) do
        ['2 book at 12.49',
         '1 music CD at 14.99',
         '1 chocolate bar at 0.85']
      end

      let(:expected_result) do
        ['2 book: 24.98',
         '1 music CD: 16.49',
         '1 chocolate bar: 0.85',
         'Sales Taxes: 1.50',
         'Total: 42.32']
      end

      it 'Returns the expected receipt for first input' do
        expect(builder.build_receipts(products)).to eq(expected_result)
      end
    end

    describe 'Second example' do
      let(:products) do
        ['1 imported box of chocolates at 10.00',
         '1 imported bottle of perfume at 47.50']
      end

      let(:expected_result) do
        ['1 imported box of chocolates: 10.50',
         '1 imported bottle of perfume: 54.65',
         'Sales Taxes: 7.65',
         'Total: 65.15']
      end

      it 'Returns the expected receipt for first input' do
        expect(builder.build_receipts(products)).to eq(expected_result)
      end
    end

    describe 'Third example' do
      let(:products) do
        ['1 imported bottle of perfume at 27.99',
         '1 bottle of perfume at 18.99',
         '1 packet of headache pills at 9.75',
         '3 imported boxes of chocolates at 11.25']
      end

      let(:expected_result) do
        ['1 imported bottle of perfume: 32.19',
         '1 bottle of perfume: 20.89',
         '1 packet of headache pills: 9.75',
         '3 imported box of chocolates: 35.55',
         'Sales Taxes: 7.90',
         'Total: 98.38']
      end

      it 'Returns the expected receipt for first input' do
        expect(builder.build_receipts(products)).to eq(expected_result)
      end
    end

    describe 'Build the receipt as a String' do
      let(:products) do
        ['1 imported bottle of perfume at 27.99',
         '1 bottle of perfume at 18.99',
         '1 packet of headache pills at 9.75',
         '3 imported boxes of chocolates at 11.25']
      end

      let(:expected_result) do
        "1 imported bottle of perfume: 32.19\n1 bottle of perfume: 20.89\n1 packet of headache pills: 9.75\n3 imported box of chocolates: 35.55\nSales Taxes: 7.90\nTotal: 98.38"
      end

      it 'Expect the result as a String' do
        expect(described_class.build_receipt(products)).to eq(expected_result)
      end
    end
  end
end
