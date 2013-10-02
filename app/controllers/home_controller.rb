class HomeController < ApplicationController
  require 'lonely_coder'

  respond_to :html, :json

  def index 
    okc = OKCupid.new('meat.book.4.u@gmail.com', 'linux*123')
    @collection = []
    @search = okc.search({
        :min_age => 25,
    :max_age => 55, 
    :gentation => 'Everybody', # don't hate
    :order_by => 'Random', # I want us to get along, let's make it last
    :last_login => 'last month',
    :location => 'New York',
    :radius => 500, # acceptable values are 25, 50, 100, 250, 500, nil
    :require_photo => true, # I like a goofy smile
    
      })
       @search.results.each{|person| @collection << person }
    5.times{search}
    
      
    respond_to do |format|
      format.html # show.html.erb

      format.json { render json: search }
    end  
  end 

  def search
    @search.load_next_page
    @search.results.each{|person| @collection << person }
    @collection.uniq!
  end

end




