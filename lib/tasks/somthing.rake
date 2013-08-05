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
			t.avatar = File.open(t.avatar.url)
			t.save!
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

namespace :utils do
	desc "modified by shell "
	task :modified_by_shell => :environment do
		url = Rails.root.to_s+"/app/uploaders/avatar_uploader.rb"
		`sed -i 's/storage :file/storage :qiniu/g' #{url}`
		
		url = Rails.root.to_s+"/config/initializers/carrierwave.rb"
		context = "config.storage             = :qiniu\\nconfig.qiniu_access_key    = \"93vlzlK9UlO6UhZaVlrZ4RyVanIv5f1meAX_ofK2\"\\nconfig.qiniu_secret_key    = \"7UGe9arh_jrxTQGa1WLba3D8xDZ-FbXOJSVYAJt7\"\\nconfig.qiniu_bucket        = \"xiadan\"\\nconfig.qiniu_bucket_domain = \"xiaddan.qiniudn.com\"\\nconfig.qiniu_block_size    = 4*1024*1024\\nconfig.qiniu_protocal      = \"http\""

		 `sed -i '3 i #{context}'  #{url}`
		# `sed -i '2 i duxiaolong\\nnnimankajd\\nasdfassadf' #{url}`

		context = "Qiniu::RS.establish_connection! :access_key => '93vlzlK9UlO6UhZaVlrZ4RyVanIv5f1meAX_ofK2',  :secret_key => '7UGe9arh_jrxTQGa1WLba3D8xDZ-FbXOJSVYAJt7'"

		url = Rails.root.to_s+"/config/qiniu-rs.rb"
		`touch #{url}`
		`cat  #{context} > #{url}`
	end
end



# sed -i 's/file/qiniu/g' ./app/uploaders/avatar_uploader.rb
# sed -i "8 i/nim"  ./app/uploaders/avatar_uploader.rb

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

	
