# Parse the CSV and seed the database here! Run 'ruby db/seed' to execute this code.
require_relative '../config/environment.rb'

# drop_table_sql = <<-SQL
# DROP TABLE guests
# SQL
#
# DB[:conn].execute(drop_table_sql)

create_table_sql = <<-SQL
  CREATE TABLE IF NOT EXISTS guests (
    id INTEGER PRIMARY KEY,
    year INTEGER,
    occupation TEXT,
    show DATETIME,
    guest_group DATE,
    name TEXT
  )
SQL

DB[:conn].execute(create_table_sql)

CSV.foreach('daily_show_guests.csv') do |row|
  if row[0] != "YEAR"
    DB[:conn].execute("INSERT INTO guests (year,occupation,show,guest_group,name) VALUES (?,?,?,?,?)",row[0],row[1],row[2],row[3],row[4])
  end
end
