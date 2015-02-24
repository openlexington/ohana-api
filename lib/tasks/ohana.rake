require 'net/http'

url_suffix = '/export?format=csv&gid='

TABS = {
  'organizations' => '0',
  'locations' => '515769274',
  'addresses' => '487062027',
  'mail_addresses' => '778957621',
  'contacts' => '817757409',
  'phones' => '245919930',
  'services' => '1942172348',
  'programs' => '1007817140',
  'regular_schedules' => '1099615328',
  'holiday_schedules' => '1983571683',
}


namespace :ohana do
  task :csv, :remote_path do |t, args|
    doc_path = args[:remote_path].rpartition('/')[0]

    Dir.mkdir 'csv' if not File.exist?('csv')
    TABS.each do |k, tab|
      uri = URI(doc_path + url_suffix + tab)
      p uri
      data = Net::HTTP.get(uri)
      p data
      out_path = File.join Dir.pwd, 'csv', k + '.csv'
      f = File.open out_path, 'w'
      f.write data
      f.close
    end
  end
end

# https://docs.google.com/a/codeforamerica.org/spreadsheets/d/19unhDQVCpPuuzn_iiK3v7O9mdH1eQqC_xufFKdU05bg/export?format=csv&gid=0&id=19unhDQVCpPuuzn_iiK3v7O9mdH1eQqC_xufFKdU05bg
# https://docs.google.com/spreadsheets/d/19unhDQVCpPuuzn_iiK3v7O9mdH1eQqC_xufFKdU05bg/export?format=csv&gid=0&id=19unhDQVCpPuuzn_iiK3v7O9mdH1eQqC_xufFKdU05bg
