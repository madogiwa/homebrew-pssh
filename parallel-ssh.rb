class ParallelSsh < Formula
  desc "Parallel SSH Tools (forked from acobaugh/pssh)"
  homepage "https://github.com/madogiwa/pssh/"
  url "https://github.com/madogiwa/pssh/archive/20181129.tar.gz"
  sha256 "6e7ee772e3353847848b19971bf0385642f954b8d7dc7c86c54701acde0a89c6"

  depends_on "python"

  conflicts_with "putty", :because => "both install `pscp` binaries"

  def install
    ENV['PYTHONPATH'] = lib/"python3.7/site-packages/"

    system "mkdir", "-p", ENV['PYTHONPATH']
    system "python3", "setup.py", "install", "--prefix=#{prefix}", "--install-data=#{share}"

    bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV['PYTHONPATH'])
  end

  test do
    system bin/"pssh", "--version"
  end
end
