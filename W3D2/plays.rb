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
  attr_accessor :title, :year, :playwright_id

  def self.all
    data = PlayDBConnection.instance.execute('SELECT * FROM plays')
    data.map { |datum| Play.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @year = options['year']
    @playwright_id = options['playwright_id']
  end

  def create
    raise '#{self} already in database' if @id
    PlayDBConnection.instance.execute(<<-SQL, @title, @year, @playwright_id)
      INSERT INTO
        play (title, year, playwright_id)
      VALUES
        (?, ?, ?)
    SQL
    @id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise '#{self} not in database' unless @id
    PlayDBConnection.instance.execute(<<-SQL, @title, @year, @playwright_id, @id)
      UPDATE
        play
      SET
        title = ?, year = ?, playwright_id = ?
      WHERE
        id = ?
    SQL
  end

  def self.find_by_title(title)
    PlayDBConnection.instance.execute(<<-SQL, title)
      SELECT
        *
      FROM
        plays
      WHERE
        title = ?
    SQL
  end

  def self.find_by_playwright(name)
    PlayDBConnection.instance.execute(<<-SQL, name)
      SELECT
        title, year
      FROM
        plays
      JOIN playwrights ON
        plays.playwright_id = playwrights.id
      WHERE
        playwrights.name = ?
    SQL
  end
end

class Playwright
  attr_accessor :name, :birth_year

  def initialize(options)
    @id = options['id']
    @name = options['name']
    @birth_year = options['birth_year']
  end

  def self.all
    data = PlayDBConnection.instance.execute('SElECT * FROM playwrights')
    data.map { |el| Playwright.new(el) }
  end

  def self.find_by_name(name)
    PlayDBConnection.instance.execute(<<-SQL, name)
      SElECT
        *
      FROM
        playwrights
      WHERE
        name = ?
    SQL
  end

  def create
    raise '#{self} already in database' if @id
    PlayDBConnection.instance.execute(<<-SQL, @name, @birth_year)
      INSERT INTO
        playwrights (name, birth_year)
      VALUES
        (?, ?)
    SQL
    @id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise '#{self} not yet in database' unless @id
    PlayDBConnection.instance.execute(<<-SQL, @name, @birth_year, @id)
      UPDATE
        playwrights
      SET
        name = ?, birth_year = ?
      WHERE
        id = ?
    SQL
  end

  #added to deal with duplicate copies of Shakespeare
  def self.delete(id)
    PlayDBConnection.instance.execute(<<-SQL, id)
      DELETE FROM playwrights
      WHERE
        id = ?
    SQL
  end

  def get_plays(name)
    PlayDBConnection.instance.execute(<<-SQL, name)
      SELECT
        title, year
      FROM
        plays
      JOIN playwrights ON
        plays.playwright_id = playwrights.id
      WHERE
        playwrights.name = ?
    SQL
  end
end