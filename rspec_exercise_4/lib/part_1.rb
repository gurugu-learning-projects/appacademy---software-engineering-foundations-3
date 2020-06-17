def my_reject(arr, &prc)
  arr.select { |ele| !prc.call(ele) }
end

def my_one?(arr, &prc)
  true_results = []

  arr.each do |ele|
    true_results << ele if prc.call(ele)
  end

  true_results.length == 1
end

def hash_select(hash, &prc)
  true_hash = Hash.new

  hash.each do |k, v|
    if prc.call(k, v)
      true_hash[k] = v
    end
  end

  true_hash
end

def xor_select(arr, prc_1, prc_2)
  results = []

  arr.each do |ele|
    if (prc_1.call(ele) && !prc_2.call(ele)) || (!prc_1.call(ele) && prc_2.call(ele))
      results << ele
    end
  end

  results
end

def proc_count(val, procs)
  procs.count { |proc| proc.call(val) }
end