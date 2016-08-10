def get_league_name_from_csv_path(csv_path)
  parts = get_csv_file_parts csv_path
  parts.drop(2).join(' ')
end

def get_start_year_from_csv_path(csv_path)
  parts = get_csv_file_parts csv_path
  parts[0].to_i
end

def get_end_year_from_csv_path(csv_path)
  parts = get_csv_file_parts csv_path
  parts[1].to_i
end

private def get_csv_file_parts(csv_path)
  extension = File.extname csv_path
  file_name = File.basename csv_path, extension
  file_name.split('_')
end
