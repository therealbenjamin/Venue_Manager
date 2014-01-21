require_relative './colors'

def clear
  puts "\e[H\e[2J"
end

def header
  clear()
  puts cyan("-" * 75)
  puts cyan("|||||" + ("+" * 65) + "|||||")
  puts cyan(("|||||" + "=" * 26) + "VENUE MANAGER" + ("=" * 26) + "|||||")
  puts cyan("|||||" + ("+" * 65) + "|||||")
  puts cyan("-" * 75)
end