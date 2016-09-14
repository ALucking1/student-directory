def input_students
  students = []

  input = false
  while input != :done do
    puts "Please enter the name of the student"
    name = gets.chomp
    puts "Please enter the student's age"
    age = gets.chomp
    #add the student hash to the array
    students << {name: name, cohort: :november, age: age}
    puts "Now we have #{students.count} students"
    # get another name from the user
    puts "Any more students to add? (yes or no)"
    input = gets.downcase.include?("y") ? false : :done
  end
  #return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each do |student|
  #if student[:name].length <12 || #student[:name].start_with?('D')
    puts "#{student[:name]} #{student[:age]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
#nothing happens until we call the methods
print_header
print(students)
print_footer(students)
