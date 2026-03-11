cask "parallel-cli" do
  version "0.1.2"

  on_arm do
    sha256 "778f4d2e33ceb49c01e28b0f8a0f3f1d691c62289d7ad59f24c6b80e549d3eca"
    url "https://github.com/parallel-web/parallel-web-tools/releases/download/v#{version}/parallel-cli-darwin-arm64.zip"
  end
  on_intel do
    sha256 "bed3183c62efdfe43c54df4899c46c5e7131d16d7455af461987019886167b2b"
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
