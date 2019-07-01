class SudoTouchid < Formula
  desc "A fork of `sudo` with Touch ID support."
  homepage "https://github.com/mattrajca/sudo-touchid"
  url "https://github.com/mattrajca/sudo-touchid", :using => :git

  depends_on :macos => :sierra
  depends_on :xcode => :build

  bottle do
    root_url 'https://github.com/paulche/homebrew-sudo-touchid/releases/download/v1.0'
    cellar :any_skip_relocation
    sha256 "cbcf58ab98389fbe3c2ea6a3a691a4d8c43361e295dc693d75f02f3c7ca6fbdc" => :sierra
  end

  def install
    xcodebuild 
    bin.install 'build/Release/sudo'
  end

  def caveats; <<-EOS
        sudo requires appropriate owner and mode: 

        /usr/bin/sudo chown root:wheel #{opt_prefix}/bin/sudo
        /usr/bin/sudo chmod 4755 #{opt_prefix}/bin/sudo

        You can also set up your PATH by adding export PATH=#{opt_prefix}/bin:$PATH to .bashrc
    EOS
  end
end
