require_relative "./receipt_builder"

file_path = ARGV[0]
p "Looking for data at: #{file_path}"
p "Result is: "
p ReceiptBuilder.build_from_file(file_path)