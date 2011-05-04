require 'benchmark'

class A
  def test
    10.times do
      yield
    end
  end
end

class B
  def test(&block)
    10.times do
      block.call
    end
  end
end

Benchmark.bm do |b|
  b.report do
    a = A.new
    10000.times do
      a.test{ 1 + 1 }
    end
  end

  b.report do
    a = B.new
    10000.times do
      a.test{ 1 + 1 }
    end
  end

  b.report do
    a = A.new
    100000.times do
      a.test{ 1 + 1 }
    end
  end

  b.report do
    a = B.new
    100000.times do
      a.test{ 1 + 1 }
    end
  end

end