require 'rubygems'
require 'closure-compiler'

class WelcomeController < ApplicationController
  def index
  end


  def results
    #@inp_code = @params['code']['body'] rescue nil
    
    @inp_code = params['code']['body']
    puts @inp_code
    out_file = File.new("inp.js", "w")
	out_file.puts(@inp_code)
	out_file.close

	@out_code = Closure::Compiler.new.compile(File.open('inp.js', 'r'))
  
  end
end
