#!/usr/bin/env ruby

# display an image in a HTML page with its imagemap pulled from exif data user_comment section, eg:
# user_comment = "coords=\"412,223,403,222,396,220,391,222,387,214,390,201,401,195,406,191,412,198,417,208,416,216\""
#
# concept and execution by boli, minced around by 732

require 'rubygems'
require 'exifr'

require 'cgi'
require 'erb'

cgi = CGI.new

case %x{ hostname -s }.chomp
when 'far'
  image_dir = "/Users/lemon/work/repo1/lemonart/800800"
when 'www'
  image_dir = "/home/vh/lemonia/wwwdocs/lemonart"
else
  image_dir = "/mnt/storage1/pics/photoshopped/lemons/800800"
end

image = Dir.glob("#{image_dir}/*.jpg").sort_by { rand }.first
raise RuntimeError, "Failed to select image from #{image_dir}" if image.nil?

print cgi.header('Status' => '200 Tangy!',
                 'X-Citric-Acid' => 'C6 H8 O7',
                 'X-E-X-E-X-E-FTang' => image,
                 'X-lemonart-revision' => "$Revision: 828 $")
alttext = "lemonia.org"
coords  = "none"
pretag  = ""
posttag = ""
usemap  = 'usemap="#map"'
file1  = EXIFR::JPEG.new(image)
if file1.exif?()
  if file1.image_description
    alttext = file1.image_description
  end
  if file1.user_comment
    if file1.user_comment[0,6] = "coords"
      coords = file1.user_comment
    end
  end
end

if coords == "none"
  pretag = '<a href="http://www.lemonia.org/endix.html">'
  posttag = '</a>'
  usemap = ''
end

ERB.new(DATA.read, 0, '%<>').run

__END__
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
    <meta name="keywords" content="lemons, lemon, lemonesque, lemonia, lemonation, lemonheads,the, a, it, of , citrus, spiritual, cult, religion, lemonheads,  fruit, food, idols, deity, deities, worships, praises, tribute, faith, technology, funk, whooop, yip yip, fish, hemiramphus, far, limpet, necton, gibber, jibber, dennis">        
    <meta name="description" content="A spiritual guide to the lemon, revel in the citrus tang and rejoice in the mystic zest of the true source of inspiration: The Lemon; This is a  Lemon dedication site for lemons, lemon lovers and lemonheads everywhere. The power of the lemon transcends all."> 
    <link rel="shortcut icon" href="http://www.lemonia.org/favicon.ico">
    <title>lemonia.org</title>
    <style type="text/css">
      /* http://www.w3.org/Style/Examples/007/center.html */
      body {background: black; }
      a:link, a:visited {color: inherit; }
      div#container {top: 0; left: 0; width: 100%; height: 100%; position: fixed; display: table}
      p {display: table-cell; vertical-align: middle}
      img.centered {display: block; margin: 1em auto}
      p {text-align: center}
    </style>
  </head>
  <body>
    <div id="container">
    <p>
       <%= pretag %><img class="centered" src="/lemonart/<%= File.basename(image) %>" alt="<%= alttext %>" border=0 <%= usemap %>><%= posttag %>
       <map name="Map" id="Map">
        <%= coords.each_line.map { |l| %Q{<area shape="poly" #{l} href="http://www.lemonia.org/endix.html" alt="clicky-lemon-yip-yip-yip!\" />} } %>
       </map>
    </p>
    </div>
  </body>
</html>

