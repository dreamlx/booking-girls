require 'rake'

namespace :utils do
	desc "Deploy all picture in local to QiuNiuCloud"
	task :deploy_picture_to_qiniu => :environment do
		url = Rails.root.to_s+"/config/photos.yml"
		@tech = Technician.all
		# self.save(@tech,url)
		result = self.get_config(url)
		result.each do |t|
			puts t.id
			puts t.name
			puts t.age
			puts t.avatar.url
		end
		@tech.each do |t|
			puts t.avatar.url
		end
	end
end


def self.save(rules,url)  
	result = true  
	begin  
		File.open("#{url}", 'w') { |f|  
			YAML.dump(rules, f)  
		}  
	rescue => err  
		logger = Logger.new(Rails.root.to_s + '/log/err.log')  
		logger.error err  
		logger.close       
		result = false  
	end  
	result  
end  

def self.get_config(url)  
	YAML::load(File.read("#{url}"))  
end 


	# def self.save(rules,url)
	# 	result = true
	# 	begin
	# 		File.open("#{url}",'w'){|f|
	# 			YAML.dump(rules.f)
	# 		}
	# 		puts url
	# 	rescue => err
	# 		logger = Logger.new(Rails.root.to_s + "/log/err.log")
	# 		logger.error err
	# 		logger.close
	# 		result = false
	# 	end
	# 	result
	# end

	
