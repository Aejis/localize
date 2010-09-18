module Localize
  class XMLadapter
    begin
      require 'xmlsimple'
    rescue LoadError
      raise "Could not load xmlsimple. Please install it with 'gem install xml-simple' or use another adapter"
    end

    def self.get_trans
      tr = {}
      Dir.glob(File.join(Localize::location, "#{Localize::locale.to_s}.xml")).each do |file|
        tr.merge! ::XmlSimple.xml_in(file, 'KeyAttr'    => { 'item' => 'name' },
                                           'ForceArray' => [ 'item' ],
                                           'ContentKey' => '-content')
      end
      tr
    end
  end
end
