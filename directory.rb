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
        puts student_number(students)
        puts "Any more students to add? (yes or no)"
        input = gets.downcase.include?("y") ? true : false
      end
    end
  #return the array of students
  students
end

def student_number(students)
  n = students.count
    if n > 1
      puts "Now we have #{students.count} students"
    elsif n == 0
      puts "We have no students"
    else
      puts "Now we have #{students.count} student"
    end
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts "-------------".center(50)
end

def print(students)
      students.sort_by do |k, v|
      puts "#{k[:cohort]} cohort, #{k[:name]}, #{k[:age]}".center(50)
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
