require 'lonely_coder'
require 'pry'

    okc = OKCupid.new('dhruv.mehrotra3@gmail.com', 'linux*1989')
    @collection = []
    
     @search = okc.search({
        :min_age => 18,
        :max_age => 99,
        :gentation => 'guys who like guys',
        :ethnicity => ['human']
      })
      
      @search.results.each{|person| @collection << person }
    
    

  

  def search
    @search.load_next_page
    @search.results.each{|person| @collection << person }
    @collection.shuffle!
  end
binding.pry

