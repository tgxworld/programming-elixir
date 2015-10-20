fizzbuzz = fn 
  0, 0, _ -> IO.puts "FizzBuzz"
  0, _, _ -> IO.puts "Fizz"
  _, 0, _ -> IO.puts "Buzz"
  _, _, c -> IO.puts c
end

fizzbuzz.(0,0,1)
fizzbuzz.(0,1,2)
fizzbuzz.(1,0,2)
fizzbuzz.(1,2,3)
