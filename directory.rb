@students = []

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to #{@filename}"
  puts "4. Load the list from #{@filename}"
  puts "9. Exit"
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
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
      puts "I don't know what you mean, try again"
  end
end

def input_students
  input = true

    while input == true do
      puts "Please enter the name of the student"
      @name = STDIN.gets.chomp

      puts "Please enter the student's age"
      @age = STDIN.gets.chomp

      puts "Please enter student cohort month (January, February, etc.)"
      @cohort = STDIN.gets.chomp
        if @cohort.empty?
          @cohort = "January"
        end

      puts "Do the details for this student - #{@name}, #{@age}, #{@cohort} - look correct? (yes or no)"
        answer = STDIN.gets.chomp
        if answer.include?("n")
          input == true
        else
          students_to_array
        end

      count_students

      puts "Any more students to add? (yes or no)"
      input = STDIN.gets.downcase.include?("y") ? true : false
    end
end

def count_students
  if @students.count == 1
    puts "We have #{@students.count} student"
  else
    puts "We have #{@students.count} students"
  end
end

def students_to_array
  @students << {name: @name, cohort: @cohort.to_sym, age: @age}
end

def show_students
  print_header
  print_students_list
  print_footer
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
  if @students.count == 1
    puts "Overall, we have #{@students.count} student".center(50)
  else
    puts "Overall, we have #{@students.count} students".center(50)
  end
end

def save_students
  #open the file for writing
  file = File.open("#{@filename}", "w")
  #iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:age]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students
  file = File.open(@filename, "r")
  file.readlines.each do |line|
  name, cohort, age = line.chomp.split(',')
    students_to_array
  end
  file.close
end

def try_load_students
  @filename = ARGV.first #first argument from the command line
  if @filename.nil?
    @filename = "students.csv"
    puts "Loaded #{@students.count} from #{@filename}"
  elsif File.exists?(@filename)
    load_students
      puts "Loaded #{@students.count} from #{@filename}"
  else
    puts "Sorry, #{@filename} doesn't exist"
    exit
  end
end

try_load_students
interactive_menu
