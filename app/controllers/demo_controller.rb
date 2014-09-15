class DemoController < ApplicationController
  layout false

  def index
  	@str = ["Bhaskar","Arjun","Mervin","Sunil","Karthik"]
  end

  def hello
  	@array = [1,2,3,4,5]
  end

  def other_hello
  	redirect_to(:controller => 'demo', :action => 'hello')
  end

  def lynda
  	redirect_to("http://lynda.com")
  end
end