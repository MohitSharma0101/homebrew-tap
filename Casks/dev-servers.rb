cask "dev-servers" do
  version "1.1.1"
  sha256 "8eac62bd2f618a639ebc879263a35eb7833b98e28da941a1de42cf6cdfaa585d"

  url "https://github.com/MohitSharma0101/swiftbar-dev-servers/releases/download/v#{version}/dev-servers.sh"
  name "Dev Servers"
  desc "SwiftBar plugin to see, start and stop local dev servers"
  homepage "https://github.com/MohitSharma0101/swiftbar-dev-servers"

  depends_on cask: "swiftbar"
  depends_on formula: "jq"
  depends_on macos: :ventura

  artifact "dev-servers.sh", target: "~/.swiftbar/dev-servers.sh"

  preflight_steps do
    set_permissions "dev-servers.sh", "0755", base: :staged_path
  end

  zap trash: [
    "~/.config/dev-servers",
    "~/Library/Application Support/dev-servers",
    "~/Library/Caches/dev-servers",
    "~/Library/Logs/dev-servers",
  ]

  caveats <<~EOS
    One more step, to point SwiftBar at Dev Servers and start it:

      ~/.swiftbar/dev-servers.sh enable

    If you already use another plugin folder, run the installer from the README instead.
  EOS
end
