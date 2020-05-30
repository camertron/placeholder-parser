# encoding: UTF-8

require 'spec_helper'

include PlaceholderParser

describe Ios do
  describe '.identify' do
    def identify(text)
      identify_all(text).first
    end

    def identify_all(text)
      Ios.identify(text)
    end

    describe 'invalid' do
      it "doesn't recognize any placeholders that don't start with a leading %" do
        expect(identify('1$2.8s')).to be_nil
      end

      it "doesn't recognize a placeholder without a conversion type" do
        expect(identify('%8')).to be_nil
      end
    end

    describe 'basics' do
      it 'recognizes a basic example' do
        ph = identify('%1$2.8s')
        expect(ph.argument_index).to eq(1)
        expect(ph.flags).to eq('$')
        expect(ph.width).to eq(2)
        expect(ph.precision).to eq(8)
        expect(ph.conversion_type).to eq('s')
      end
    end

    # describe 'flags' do
    #   it 'recognizes the grouping separator flag' do
    #     expect(identify('%,d').flags).to eq(',')
    #   end

    #   it 'recognizes the always show sign flag' do
    #     expect(identify('%+d').flags).to eq('+')
    #   end

    #   it 'recognizes the flag that indicates non-negative leading spaces' do
    #     expect(identify('% d').flags).to eq(' ')
    #   end

    #   it 'recognizes the flag that indicates parens around negative numbers' do
    #     expect(identify('%(d').flags).to eq('(')
    #   end

    #   it 'recognizes the left-justify flag (requires width)' do
    #     ph = identify('%-6d')
    #     expect(ph.flags).to eq('-')
    #     expect(ph.width).to eq(6)
    #   end

    #   it 'recognizes the leading zeroes padding flag (requires width)' do
    #     ph = identify('%06d')
    #     expect(ph.flags).to eq('0')
    #     expect(ph.width).to eq(6)
    #   end

    #   it 'recognizes the alternate octal/hex flag' do
    #     expect(identify('%#x').flags).to eq('#')
    #   end
    # end

    # describe 'width' do
    #   it 'recognizes width' do
    #     expect(identify('%07d').width).to eq(7)
    #   end
    # end

    # describe 'precision' do
    #   it 'recognizes a zero precision' do
    #     expect(identify('%1.0s').precision).to eq(0)
    #   end

    #   it 'recognizes a non-zero precision' do
    #     expect(identify('%1.5s').precision).to eq(5)
    #   end

    #   it 'does not recognize a precision without a conversion type' do
    #     expect(identify('%1.5')).to be_nil
    #   end
    # end

    # describe 'conversion types' do
    #   it 'recognizes string conversion types' do
    #     first, second = identify_all('%s %S')
    #     expect(first.conversion_type).to eq('s')
    #     expect(second.conversion_type).to eq('S')
    #   end

    #   it 'recognizes character conversion types' do
    #     first, second = identify_all('%c %C')
    #     expect(first.conversion_type).to eq('c')
    #     expect(second.conversion_type).to eq('C')
    #   end

    #   it 'recognizes the decimal conversion type' do
    #     expect(identify('%d').conversion_type).to eq('d')
    #   end

    #   it 'recognizes the octal conversion type' do
    #     expect(identify('%o').conversion_type).to eq('o')
    #   end

    #   it 'recognizes hexadecimal conversion types' do
    #     first, second = identify_all('%x %X')
    #     expect(first.conversion_type).to eq('x')
    #     expect(second.conversion_type).to eq('X')
    #   end

    #   it 'recognizes the decimal floating point conversion type' do
    #     expect(identify('%f').conversion_type).to eq('f')
    #   end

    #   it 'recognizes exponential floating point conversion types' do
    #     first, second = identify_all('%e %E')
    #     expect(first.conversion_type).to eq('e')
    #     expect(second.conversion_type).to eq('E')
    #   end

    #   it 'recognizes decimal/exponential conversion types (depends on magnitude)' do
    #     first, second = identify_all('%g %G')
    #     expect(first.conversion_type).to eq('g')
    #     expect(second.conversion_type).to eq('G')
    #   end

    #   it 'recognizes hexadecimal floating point conversion types' do
    #     first, second = identify_all('%a %A')
    #     expect(first.conversion_type).to eq('a')
    #     expect(second.conversion_type).to eq('A')
    #   end

    #   it 'recognizes boolean conversion types' do
    #     first, second = identify_all('%b %B')
    #     expect(first.conversion_type).to eq('b')
    #     expect(second.conversion_type).to eq('B')
    #   end

    #   it 'recognizes hash code conversion types' do
    #     first, second = identify_all('%h %H')
    #     expect(first.conversion_type).to eq('h')
    #     expect(second.conversion_type).to eq('H')
    #   end

    #   it 'recognizes a literal percent character' do
    #     expect(identify('%%').conversion_type).to eq('%')
    #   end

    #   it 'recognizes newlines' do
    #     expect(identify('%n').conversion_type).to eq('n')
    #   end

    #   date_time_types = %w(ta tA tb tB tc tC td tD te tF th tH tI) +
    #     %w(tj tk tl tL tm tM tN tp tQ tr tR ts tS tT ty tY tz tZ)

    #   date_time_types.each do |type|
    #     it "recognizes the '#{type}' conversion types" do
    #       expect(identify("%#{type}").conversion_type).to eq(type)
    #     end

    #     type[0] = type[0].upcase

    #     it "recognizes the '#{type}' conversion types" do
    #       expect(identify("%#{type}").conversion_type).to eq(type)
    #     end
    #   end
    # end
  end
end
