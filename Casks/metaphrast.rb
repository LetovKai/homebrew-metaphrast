# Homebrew Cask для десктоп-клиента Metaphrast (Apple Silicon).
#
# Куда положить: в свой tap-репозиторий `homebrew-metaphrast`, путь
#   Casks/metaphrast.rb
# Установка у пользователя:
#   brew tap <owner>/metaphrast
#   brew install --cask metaphrast
#
# При новом релизе обновить version + sha256 (shasum -a 256 <dmg>) и URL.
# Бинарь universal (arm64 + x86_64) — один dmg на все Маки.
cask "metaphrast" do
  version "0.1.2"
  sha256 "dab99ce41be7be46a67f4a6061716873a8e231cef5bc348fbd22e102d699eb85"

  url "https://metaphrast.org/downloads/Metaphrast_#{version}_universal.dmg"
  name "Metaphrast"
  desc "Realtime conference translation capture client"
  homepage "https://metaphrast.org"

  depends_on macos: :big_sur

  app "Metaphrast.app"

  # Кеды оператора хранятся в Keychain (service org.metaphrast.client) —
  # brew их не трогает; при желании удалить вручную через «Связку ключей».
  zap trash: [
    "~/Library/Application Support/org.metaphrast.client",
    "~/Library/Caches/org.metaphrast.client",
    "~/Library/WebKit/org.metaphrast.client",
  ]
end
