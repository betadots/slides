# frozen_string_literal: true

slide_dirs = Dir.glob('**/slides.md')
                 .map { |path| File.dirname(path) }
                 .reject { |dir| dir.start_with?('template') }

html = <<~HTML
  <html>
    <head>
      <title>betadots Conference Slides</title>
    </head>
    <body>
      <h1>betadots Conference Slides</h1>
      <ul>
        #{slide_dirs.map { |dir| "<li><a href=\"#{dir}/\">#{dir}</a></li>" }.join("\n      ")}
      </ul>
    </body>
  </html>
HTML

File.write('index.html', html)
puts "Generated index.html with #{slide_dirs.size} entries."
