def colorize(text, color_code)
  "\e[#{color_code}m#{text}\e[0m"
end

def black(text); colorize(text, 30); end
def red(text); colorize(text, 31); end
def green(text); colorize(text, 32); end
def yellow(text); colorize(text, 33); end
def blue(text); colorize(text, 34); end
def purple(text); colorize(text, 35); end
def cyan(text); colorize(text, 36); end
def white(text); colorize(text, 37); end