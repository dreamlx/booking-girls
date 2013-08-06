require 'rake'

namespace :utils do

	desc "Deploy all picture in local to QiuNiuCloud"
	task :deploy_picture_to_qiniu => :environment do
		@coy = Company.all
		@tech = Technician.all
		@ve = Venue.all
		@sm = ServiceMenu.all
		@pic = Pic.all
		modified_by_shell
		upload_to_qiniu(@t,1)
		upload_to_qiniu(@tech,1)
		upload_to_qiniu(@ve,1)
		upload_to_qiniu(@sm,1)
		upload_to_qiniu(@pic,2)
	end

	desc "update_gemfile"
	task :update_gemfile => :environment do
		url = Rails.root.to_s+"/Gemfile"
		context = "gem \"qiniu-rs\" \\n gem \"carrierwave-qiniu\""
		`sed -i '4 i #{context}' #{url}`
	end
end

def upload_to_qiniu(ava,a)
	case a
	when 1
		if !ava.nil?
			ava.each do |t|
				if t.avatar.url.nil? 
					puts "avatar is nil"
				else
					puts t.avatar.current_path
					if FileTest::exist?(t.photo.current_path)
						t.avatar = File.open(t.avatar.current_path)
						t.save!
						puts "upload is success to qiniu"
						puts "qiniu address #{t.avatar.url}"
					else
						puts "file is exist"
					end
				end
			end
		end
	when 2
		if !ava.nil?
			ava.each do |t|
				if t.photo.url.nil? 
					puts "photo is nil"
				else
					puts t.photo.current_path
					if FileTest::exist?(t.photo.current_path)
						t.photo = File.open(t.photo.current_path)
						t.save!
						puts "upload is success to qiniu"
						puts "qiniu address #{t.photo.url}"
					else
						puts "file is exist"
					end
				end
			end
		end
	end
end

def modified_by_shell
	
	url = Rails.root.to_s+"/app/uploaders/avatar_uploader.rb"
	`sed -i 's/storage :file/storage :qiniu/g' #{url}`

	url = Rails.root.to_s+"/app/uploaders/photo_uploader.rb"
	`sed -i 's/storage :file/storage :qiniu/g' #{url}`

	url = Rails.root.to_s+"/config/initializers/carrierwave.rb"
	context = "config.storage             = :qiniu\\nconfig.qiniu_access_key    = \"93vlzlK9UlO6UhZaVlrZ4RyVanIv5f1meAX_ofK2\"\\nconfig.qiniu_secret_key    = \"7UGe9arh_jrxTQGa1WLba3D8xDZ-FbXOJSVYAJt7\"\\nconfig.qiniu_bucket        = \"xiadan\"\\nconfig.qiniu_bucket_domain = \"xiaddan.qiniudn.com\"\\nconfig.qiniu_block_size    = 4*1024*1024\\nconfig.qiniu_protocal      = \"http\""
	`sed -i '12 i #{context}'  #{url}`

	url = Rails.root.to_s+"/config/qiniu-rs.rb"
	context = "Qiniu::RS.establish_connection! :access_key => '93vlzlK9UlO6UhZaVlrZ4RyVanIv5f1meAX_ofK2', \n :secret_key => '7UGe9arh_jrxTQGa1WLba3D8xDZ-FbXOJSVYAJt7'"
	`touch #{url}`
	file = File.open("#{url}","w")
	file.puts context
	file.close
end

# def self.save(rules,url)  
# 	result = true  
# 	begin  
# 		File.open("#{url}", 'w') { |f|  
# 			YAML.dump(rules, f)  
# 		}  
# 	rescue => err  
# 		logger = Logger.new(Rails.root.to_s + '/log/err.log')  
# 		logger.error err  
# 		logger.close       
# 		result = false  
# 	end  
# 	result  
# end 

# def self.get_config(url)  
# 	YAML::load(File.read("#{url}"))  
# end 

	
