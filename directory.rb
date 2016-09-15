def input_students
  students = []
  input = true

    while input == true do
      puts "Please enter the name of the student"
      name = gets.chomp

      puts "Please enter the student's age"
      age = gets.chomp

      puts "Please enter student cohort month (January, February, etc.)"
      cohort = gets.chomp
      if cohort.empty?
        puts "Please enter student cohort month (January, February, etc.)"
        cohort = gets.chomp
      end
      if cohort.empty?
        cohort = "January"
      end
    cohort.to_sym

    puts "Do all the details for this student look correct? (yes or no)"
    puts name
    puts age
    puts cohort
    answer = gets.chomp
      if answer.include?("n")
        input == true
      else
        students << {name: name, cohort: cohort, age: age}
        puts "Now we have #{students.count} students"
        puts "Any more students to add? (yes or no)"
        input = gets.downcase.include?("y") ? true : false
      end
    end
  #return the array of students
  students
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts "-------------".center(50)
end

def print(students)
  students.each do |student|
  #if student[:name].length <12 || #student[:name].start_with?('D')
    puts "#{student[:name]} #{student[:age]} (#{student[:cohort]} cohort)".center(50)
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(50)
end

students = input_students
#nothing happens until we call the methods
print_header
print(students)
print_footer(students)
