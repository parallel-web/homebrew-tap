cask "parallel-cli" do
  version "0.9.4"

  on_macos do
    on_arm do
      sha256 "a0835de753508b83d4700d6e53a0267fd688f681d2d281f7eea613b89b0f5d5c"
      url "https://github.com/parallel-web/parallel-web-tools/releases/download/v#{version}/parallel-cli-darwin-arm64.zip"
    end
    on_intel do
      sha256 "90a90e050c4b96206e418272bad3e9480005dee855c1f3f966435d6b2267e183"
      url "https://github.com/parallel-web/parallel-web-tools/releases/download/v#{version}/parallel-cli-darwin-x64.zip"
    end
  end
  on_linux do
    on_arm do
      sha256 "e176b05459132fd985c79211e40ae0a32a50ce8a82f78d44c6c99940c90d9467"
      url "https://github.com/parallel-web/parallel-web-tools/releases/download/v#{version}/parallel-cli-linux-arm64.zip"
    end
    on_intel do
      sha256 "51b21f94b74f5cfc61d416d035f589191238d8a100a28ca997380ec2061c1083"
      url "https://github.com/parallel-web/parallel-web-tools/releases/download/v#{version}/parallel-cli-linux-x64.zip"
    end
  end

  name "Parallel CLI"
  desc "CLI for the Parallel API - search, extract, research, and enrich data"
  homepage "https://github.com/parallel-web/parallel-web-tools"

  binary "parallel-cli/parallel-cli"

  preflight do
    # Strip quarantine — binary is not notarized (same approach as kreuzberg, etc.)
    if OS.mac?
      system_command "/usr/bin/xattr",
                     args: ["-dr", "com.apple.quarantine", "#{staged_path}/parallel-cli"]
    end
  end

  zap trash: "~/.parallel-cli"
end
