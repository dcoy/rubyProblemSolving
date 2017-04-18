def fizzy(n)
  if n % 15 == 0
    puts 'fizzbuzz'
  elsif n % 5 == 0
    puts 'buzz'
  elsif n % 3 == 0
    puts 'fizz'
  else
    puts n
  end
end

fizzy(ARGV[0].to_i)
