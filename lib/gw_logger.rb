require 'logger'

class GWLogger

  def info msg, new_line=true
    printf ">> #{Time.now.strftime("%Y-%m-%d %H:%M:%S")}: #{msg}"
    puts if new_line
    yield if block_given?
  end

=begin
  def format_message(severity, timestamp, progname, msg)
    ">> #{Time.now.strftime("%Y-%m-%d %H:%M:%S")}: #{msg}\n"
  end
=end
end
