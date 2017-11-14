require_relative '../config/environment.rb'
# Write methods that return SQL queries for each part of the challeng here

def guest_with_most_appearances
  # write your query here!
  # Who did Jon Stewart have on the Daily Show the most?
  sql = <<-SQL
    select name from (select name, count(*) from guests group by name order by count(*) DESC) LIMIT 1;
  SQL
  DB[:conn].execute(sql)
end

def most_popular_profession
  #What profession was on the show most overall?
  sql = <<-SQL
    select occupation from (select occupation, count(*) from guests group by occupation order by count(*) DESC) LIMIT 1;
  SQL
  DB[:conn].execute(sql)
end

def most_popular_profession_year
  #What was the most popular profession of guest for each year Jon Stewart hosted the Daily Show?
  sql = <<-SQL
    select year, occupation, MAX(total) from (select year, occupation, count(*) as total from guests group by year, occupation) group by year;
  SQL
  DB[:conn].execute(sql)
end

def total_bills
  #How many people did Jon Stewart have on with the first name of Bill?
  sql = <<-SQL
    select count(*) from guests where name like 'Bill%';
  SQL
  DB[:conn].execute(sql)
end

def patrick_stewart
  #What dates did Patrick Stewart appear on the show?
  sql = <<-SQL
    select show from guests where name = 'Patrick Stewart';
  SQL
  DB[:conn].execute(sql)
end

def year_most_guests
  #Which year had the most guests?
  sql = <<-SQL
    select year from (select year, count(*) from guests group by year order by count(*) DESC) LIMIT 1;
  SQL
  DB[:conn].execute(sql)
end

def most_popular_group_year
  #What was the most popular "Group" for each year Jon Stewart hosted?
  sql = <<-SQL
    select year, guest_group, MAX(total) from (select year, guest_group, count(*) as total from guests group by year, guest_group) group by year;
  SQL
  DB[:conn].execute(sql)
end
