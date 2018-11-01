module Morph
  class TimeCommand
    def self.command(other, metric_file)
      ['/usr/bin/time', '-v', '-o', metric_file] + other
    end

    # Parse the output of the time command and return a hash of the parameters
    def self.params_from_string(s)
      params = s.split("\n").inject({}) do |params, line|
        r = parse_line(line)
        params.merge(r ? { r[0] => r[1] } : {})
      end
      # There's a bug in GNU time 1.7 which wrongly reports the maximum resident
      # set size on the version of Ubuntu that we're using.
      # See https://groups.google.com/forum/#!topic/gnu.utils.help/u1MOsHL4bhg
      # Let's fix it up
      if params[:page_size]
        params[:maxrss] = params[:maxrss] * 1024 / params[:page_size]
      else
        # If we can't get the page size we can't really figure out maxrss
        params[:maxrss] = nil
      end

      # page_size isn't an attribute on this model
      params.delete(:page_size)
      params
    end

    def self.parse_line(l)
      field, value = l.split(': ')
      case field
      when /Maximum resident set size \(kbytes\)/
        [:maxrss, value.to_i]
      when /Minor \(reclaiming a frame\) page faults/
        [:minflt, value.to_i]
      when %r{Major \(requiring I/O\) page faults}
        [:majflt, value.to_i]
      when /User time \(seconds\)/
        [:utime, value.to_f]
      when /System time \(seconds\)/
        [:stime, value.to_f]
      when /Elapsed \(wall clock\) time \(h:mm:ss or m:ss\)/
        n = value.split(':').map(&:to_f)
        if n.count == 2
          m, s = n
          h = 0
        elsif n.count == 3
          h, m, s = n
        end
        [:wall_time, (h * 60 + m) * 60 + s]
      when /File system inputs/
        [:inblock, value.to_i]
      when /File system outputs/
        [:oublock, value.to_i]
      when /Voluntary context switches/
        [:nvcsw, value.to_i]
      when /Involuntary context switches/
        [:nivcsw, value.to_i]
      when /Page size \(bytes\)/
        [:page_size, value.to_i]
      end
    end
  end
end
