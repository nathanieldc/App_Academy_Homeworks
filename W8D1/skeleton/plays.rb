require 'sqlite3'
require 'singleton'

class PlayDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('plays.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Play
  attr_accessor :id, :title, :year, :playwright_id

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM plays")
    data.map { |datum| Play.new(datum) }
  end

  def self.find_by_title(title)
    play = PlayDBConnection.instance.execute(<<-SQL, title)
    SELECT *
    FROM plays
    WHERE title = ?
    SQL
  end

  def self.find_by_playwright(name)
    play = PlayDBConnection.instance.execute(<<-SQL, name)
    SELECT plays.*
    FROM plays
    LEFT JOIN playwrights
    ON plays.playwright_id = playwrights.id
    WHERE playwrights.name = ?  
    SQL
  end

# CREATE TABLE plays (
#   id INTEGER PRIMARY KEY,
#   title TEXT NOT NULL,
#   year INTEGER NOT NULL,
#   playwright_id INTEGER NOT NULL,

#   FOREIGN KEY (playwright_id) REFERENCES playwrights(id)
# );

# DROP TABLE if exists playwrights;

# CREATE TABLE playwrights (
#   id INTEGER PRIMARY KEY,
#   name TEXT NOT NULL,
#   birth_year INTEGER
# );

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @year = options['year']
    @playwright_id = options['playwright_id']
  end

  def create
    raise "#{self} already in database" if self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id)
      INSERT INTO
        plays (title, year, playwright_id)
      VALUES
        (?, ?, ?)
    SQL
    self.id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id, self.id)
      UPDATE
        plays
      SET
        title = ?, year = ?, playwright_id = ?
      WHERE
        id = ?
    SQL
  end
end
