@students = []

def input_students
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
      else @students << {name: name, cohort: cohort, age: age}
      end

      if @students.count > 1
        puts "Now we have #{@students.count} students"
      elsif @students.count == 0
        puts "We have no students"
      else
        puts "Now we have #{@students.count} student"
      end

      puts "Any more students to add? (yes or no)"
      input = gets.downcase.include?("y") ? true : false
    end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
  end
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts "-------------".center(50)
end

def print_students_list
  @students.sort_by do |k, v|
    puts "#{k[:cohort]} cohort, #{k[:name]}, #{k[:age]}".center(50)
  end
end

def print_footer
  if @students.count > 1
    puts "Overall, we have #{@students.count} students".center(50)
  elsif @students.count == 0
    puts "Overall, we have no students".center(50)
  else
    puts "Overall, we have #{@students.count} student".center(50)
  end
end

def save_students
  #open the file for writing
  file = File.open("students.csv", "w")
  #iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

interactive_menu
