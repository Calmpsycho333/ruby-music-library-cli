class MusicImporter

    attr_reader :path
  
    def initialize(path)
      @path = path
    end
  
    def files
      @files ||= Dir.glob("#{path}/*.mp3").collect{|placeholder| placeholder.gsub("#{path}/", "")}
    end
  
    def import
      files.each{|placeholder| Song.create_from_filename(placeholder)}
    end
  end 