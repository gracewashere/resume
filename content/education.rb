module Education
  class Topic
    def self.store
      @@store ||= []
    end

    def self.all
      store
    end

    def save
      Topic.store << self
      self
    end

    def self.destroy_all
      @@store = nil
    end

    class InvalidRecord < StandardError; end

    def initialize name, gpa
      @name, @gpa = name, gpa

      raise InvalidRecord unless valid?
    end

    attr_reader :name

    def gpa
      @gpa.to_f
    end

    def formatted_gpa
      "%.1f" % gpa
    end

    def valid?
      valid_name? and valid_gpa?
    end

    private

    def valid_name?
      name
    end

    def valid_gpa?
      @gpa && gpa >= 0 && gpa <= 4
    end
  end
end
