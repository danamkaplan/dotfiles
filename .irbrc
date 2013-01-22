require 'irb/completion'
require 'irb/ext/save-history'
require 'pp'

IRB.conf[:SAVE_HISTORY] = 500
IRB.conf[:HISTORY_FILE] = File.expand_path('~/.irb_history')
IRB.conf[:PROMPT_MODE]  = :SIMPLE


# http://ozmm.org/posts/time_in_irb.html
def time(times = 1)
  require 'benchmark'
  ret = nil
  Benchmark.bm { |x| x.report { times.times { ret = yield } } }
  ret
end

# list object methods
def local_methods(obj=self)
  (obj.methods - obj.class.superclass.instance_methods).sort
end

def ls(obj=self)
  width = `stty size 2>/dev/null`.split(/\s+/, 2).last.to_i
  width = 80 if width == 0
  local_methods(obj).each_slice(3) do |meths|
    pattern = "%-#{width / 3}s" * meths.length
    puts pattern % meths
  end
end
