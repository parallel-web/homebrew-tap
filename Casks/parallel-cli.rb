cask "parallel-cli" do
  version "0.9.2"

  on_arm do
    sha256 "b6a4506c4573766bcc3be9620cbee3051d5cb01601c05ca2c3e8ec32df02c942"
    url "https://github.com/parallel-web/parallel-web-tools/releases/download/v#{version}/parallel-cli-darwin-arm64.zip"
  end
  on_intel do
    sha256 "c35a19b51b8f9fcf3aec96f72613d91b0d33a796cffb00219a99e036285bb08c"
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
