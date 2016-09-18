def interactive_menu
  students = [] #has to be declared outside the loop
  loop do
    #1, print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    #2, read the input and save it into a variable
    selection = gets.chomp
    #3, do what the user has asked
    case selection
      when "1"
        students = input_students
      when "2"
        print_header
        print(students)
        print_footer(students)
      when "9"
        exit #this will cause the program to terminate
      else
        puts "I don't know what you meant, try again"
    end
  end
end

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
      else students << {name: name, cohort: cohort, age: age}
      end
      
      if students.count > 1
        puts "Now we have #{students.count} students"
      elsif students.count == 0
        puts "We have no students"
      else
        puts "Now we have #{students.count} student"
      end

        puts "Any more students to add? (yes or no)"
        input = gets.downcase.include?("y") ? true : false
  end
  #return the array of students
  students
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
  if students.count > 1
    puts "Overall, we have #{students.count} students".center(50)
  elsif students.count == 0
    puts "Overall, we have no students".center(50)
  else
    puts "Overall, we have #{students.count} student".center(50)
  end
end

interactive_menu
