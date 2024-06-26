require 'ruby2d'

set title: "LunaCoin", width: 375, height: 600

Image.new('image/back.png')

print "Enter your name > "
name = gets.chomp.to_s

song = Music.new('image/song.mp3')
song.volume = 20
song.loop = true
song.play

value = 0

text = Text.new(
  '',
  style: 'bold',
  size: 30,
  color: 'blue',
  z: 1
)

image = Image.new(
  'image/luna.png',
  x: 114, y: 220,
  width: 155, height: 155,
  z: 2
)

profile = Image.new(
  'image/profile.png',
  x: 20, y: 520,
  width: 60, height: 60,
  z: 1
)


menu = Square.new(
  x: 35, y: 66,
  size: 310,
  color: 'black',
  z: 3
)
stats = Text.new(
  "Name: #{name}",
  x: 45, y: 76,
  style: 'bold',
  size: 20,
  color: 'blue',
  z: 4
)
menu.remove
stats.remove


on :mouse_down do |event|
  if event.button == :left
    if event.x >= image.x && event.x <= (image.x + image.width) && event.y >= image.y && event.y <= (image.y + image.height)
      value += 1
      image.width = 150
      image.height = 150
      image.x = image.x + 3
      image.y = image.y + 3

    elsif event.x >= profile.x && event.x <= (profile.x + profile.width) && event.y >= profile.y && event.y <= (profile.y + profile.height)
      menu.add
      stats.add

    else
      menu.remove
      stats.remove
    end
  end
end

on :mouse_up do |event|
  case event.button
  when :left
    image.width = 156
    image.height = 156
    image.x = 114
    image.y = 220
  end
end


update do
  text.text = value
  text.x = (Window.width - text.width) / 2
  text.y = (Window.height - text.height) / 3
end

show
