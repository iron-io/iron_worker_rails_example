require 'active_support/core_ext'
class ComplexModel
  attr_accessor :a, :b, :sum, :av, :hash_value

  def calculate
    count = 0
    if a.is_a? Array
      sum_a = a.sum
      count+=a.count
    else
      count+=1
    end

    if b.is_a? Array
      sum_b = b.sum
      count+=b.count
    else
      count+=1
    end
    self.sum = (sum_a||a) + (sum_b||b)
    self.av = ((sum_a||a) + (sum_b||b)).to_f/count
    self.hash_value={'a' => self.a, 'b' => self.b, 'sum' => self.sum, 'av' => self.av.round(2)}
  end

  def to_json(*a)
    hash_data = {}
    self.instance_variables.each do |var|
      hash_data[var] = self.instance_variable_get var
    end

    hash = {}
    hash['json_class'] = self.class.name
    hash['data'] = hash_data
    hash.to_json(*a)
  end

  def self.json_create(a)
    model = new
    a["data"].each do |var, val|
      model.instance_variable_set var, val
    end
    model
  end
end