dracula_url <- "https://raw.githubusercontent.com/dracula/draculatheme.com/964b5690efc4b7bac31a47551662fe04528d8e19/public/images/hero/dracula-icon.svg"
signature_dest_path <- file.path("data-raw", "stickers", "dracula.svg")
raw_log_path <- file.path("data-raw", "stickers", "logo-raw.svg")

download.file(dracula_url, signature_dest_path)

hexSticker::sticker(
  signature_dest_path,
  package = "dRacula",
  spotlight = FALSE,
  h_size = 1.5,
  h_color = "black",
  h_fill = "#BD93F9",
  p_size = 0.5,
  p_y = 0.1,
  s_x = 1,
  s_y = 0.95,
  s_width = 0.95,
  u_size = 4,
  u_y = 0.1,
  u_color = "black",
  filename = raw_log_path,
  dpi = 600
)

usethis::use_logo(raw_log_path)
