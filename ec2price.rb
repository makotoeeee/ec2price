require 'open-uri'
require 'yaml'
require 'json'

#
class Ec2Price
  urls = {
    amazon: 'https://a0.awsstatic.com/pricing/1/deprecated/ec2/linux-od.json',
    mswin: 'https://a0.awsstatic.com/pricing/1/deprecated/ec2/mswin-od.json',
    rhel: 'https://a0.awsstatic.com/pricing/1/deprecated/ec2/rhel-od.json'
  }.each_key do |os|
    define_method("get_#{os}") { open(urls[os]).read }
  end
end

puts Ec2Price.new.get_amazon
