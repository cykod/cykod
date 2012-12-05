
# Rspec core was using existance of ActiveRecord
# to assume it was there
Object.send(:remove_const, "ActiveRecord")
