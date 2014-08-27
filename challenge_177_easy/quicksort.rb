def quicksort(array)
  return array if array.size <= 1
  pivot = array.pop
  greater, less = array.partition{|num| num > pivot}
  return quicksort(less) + [pivot] + quicksort(greater)
end
