cask "parallel-cli" do
  version "0.5.0"

  on_arm do
    sha256 "6151e374f070d855dbf1b2a066eec843b358b6a53728e5b68f89f4e9a08eb83c"
    url "https://github.com/parallel-web/parallel-web-tools/releases/download/v#{version}/parallel-cli-darwin-arm64.zip"
  end
  on_intel do
    sha256 "6678d0cc2c3fa60cf5cac5c06fe3086a6f268dbb5212b73ba66f4ba30382eb66"
    url "https://github.com/parallel-web/parallel-web-tools/releases/download/v#{version}/parallel-cli-darwin-x64.zip"
  end

  name "Parallel CLI"
  desc "CLI for the Parallel API - search, extract, research, and enrich data"
  homepage "https://github.com/parallel-web/parallel-web-tools"

  binary "parallel-cli/parallel-cli"

  preflight do
    # Strip quarantine — binary is not notarized (same approach as kreuzberg, etc.)
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{staged_path}/parallel-cli"]
  end

  zap trash: "~/.parallel-cli"
end
