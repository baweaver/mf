RSpec.describe Mf do
  it "has a version number" do
    expect(Mf::VERSION).not_to be nil
  end

  describe 'Public API' do
    let(:numbers) { [1,2,3,4,5] }
    let(:strings) { %w(foo bar baz) }
    let(:arrays) { [[1], [2], [3]] }
    let(:hashes) { [{a: 1, b: 2}, {b: 2, c: 3}, {a: 1, b: 2, c: 3}] }

    describe '+' do
      it 'can perform an add' do
        expect(numbers.map(&Mf + 5)).to eq([6, 7, 8, 9, 10])
      end

      it 'can suffix a string' do
        expect(strings.map(&Mf + 'bar')).to eq(%w(foobar barbar bazbar))
      end

      it 'can join arrays' do
        expect(arrays.map(&Mf + [1])).to eq([[1, 1], [2, 1], [3, 1]])
      end
    end

    describe '-' do
      it 'can perform a subtraction' do
        expect(numbers.map(&Mf - 5)).to eq([-4, -3, -2, -1, 0])
      end
    end

    describe '*' do
      it 'can perform a multiplication' do
        expect(numbers.map(&Mf * 5)).to eq([5, 10, 15, 20, 25])
      end

      it 'can multiply a string' do
        expect(strings.map(&Mf * 2)).to eq(%w(foofoo barbar bazbaz))
      end

      it 'can multiply an array' do
        expect(arrays.map(&Mf * 2)).to eq([[1, 1], [2, 2], [3, 3]])
      end

      it 'can join an array, but please please please just use join' do
        expect(arrays.map(&Mf * '')).to eq(%w(1 2 3))
      end
    end

    describe '/' do
      it 'can perform a division' do
        expect(numbers.map(&Mf / 5.0)).to eq([0.2, 0.4, 0.6, 0.8, 1.0])
      end
    end

    describe '%' do
      it 'can perform a modulo' do
        expect(numbers.map(&Mf % 5)).to eq([1, 2, 3, 4, 0])
      end
    end

    describe '**' do
      it 'can perform a power' do
        expect(numbers.map(&Mf ** 5)).to eq([1, 32, 243, 1024, 3125])
      end
    end

    describe '>' do
      it 'can perform a greater than comparator' do
        expect(numbers.select(&Mf > 3)).to eq([4, 5])
      end
    end

    describe '>=' do
      it 'can perform a greater than or equal to comparator' do
        expect(numbers.select(&Mf >= 3)).to eq([3, 4, 5])
      end
    end

    describe '<' do
      it 'can perform a less than comparator' do
        expect(numbers.select(&Mf < 3)).to eq([1, 2])
      end
    end

    describe '<=' do
      it 'can perform a less than or equal to comparator' do
        expect(numbers.select(&Mf <= 3)).to eq([1, 2, 3])
      end
    end

    describe '<=>' do
      it 'can perform a rocketship comparator' do
        expect(numbers.map(&Mf <=> 3)).to eq([-1, -1, 0, 1, 1])
      end
    end

    describe '==' do
      it 'can perform a double equals' do
        expect(numbers.select(&Mf == 5)).to eq([5])
      end
    end

    describe '===' do
      it 'can perform a triple equals' do
        expect(numbers.select(&Mf === (1..3))).to eq([1, 2, 3])
      end
    end

    describe '|' do
      it 'can perform a bitwise |' do
        expect(numbers.map(&Mf | 5)).to eq([5, 7, 7, 5, 5])
      end
    end

    describe '&' do
      it 'can perform a bitwise &' do
        expect(numbers.map(&Mf & 5)).to eq([1, 0, 1, 4, 5])
      end
    end

    describe '>>' do
      it 'can perform a right shift' do
        expect(numbers.map(&Mf >> 5)).to eq([0, 0, 0, 0, 0])
      end
    end

    describe '<<' do
      it 'can perform a left shift' do
        expect(numbers.map(&Mf << 5)).to eq([32, 64, 96, 128, 160])
      end
    end

    describe '[]' do
      it 'can perform a range extraction on strings' do
        expect(strings.map(&Mf[0..1])).to eq(%w(fo ba ba))
      end

      it 'can perform an element extraction on an array' do
        expect(arrays.map(&Mf[0])).to eq([1, 2, 3])
      end

      it 'can perform an element extraction on a hash' do
        expect(hashes.map(&Mf[:a])).to eq([1, nil, 1])
      end
    end
  end
end
