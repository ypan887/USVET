require 'fileutils'

desc "Create nondigest versions of all ckeditor digest assets"
task "assets:precompile" do
  fingerprint = /\-[0-9a-f]{32}\./
  for file in Dir["public/assets/ckeditor/**/*"]
    next unless file =~ fingerprint
    nondigest = file.sub fingerprint, '.'
    FileUtils.cp file, nondigest, verbose: true
  end
end

desc "Copy youtube plugin"
task "ckeditor:copy:plugins" => :environment do
  source = Rails.root.join('app', 'assets', 'javascripts', 'ckeditor', 'plugins')
  dest = Rails.root.join('public', 'assets', 'ckeditor', 'plugins')
  FileUtils.copy_entry source, dest
end

# auto run ckeditor:create_nondigest_assets after assets:precompile
Rake::Task['assets:precompile'].enhance do
  Rake::Task['ckeditor:copy:plugins'].invoke
end