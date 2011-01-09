require 'rcov/rcovtask'

  Rcov::RcovTask.new do |t|
    t.libs << "test"
    t.test_files = FileList['test/test*.rb']
    t.verbose = true
    t.rcov_opts = ["--rails -x gems -x teamcity"]
  end
