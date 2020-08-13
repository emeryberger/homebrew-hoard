class Libhoard < Formula
  desc "Fast malloc replacement"
  homepage "https://www.hoard.org"

  head do
    url "https://github.com/emeryberger/Hoard.git", :branch => "master"
  end

  def install
#    inreplace "heaplayers-make.mk", /git clone https:\/\/github.com\/emeryberger\/Heap-Layers/, "/usr/bin/true"
#    system "git", "clone", "https://github.com/emeryberger/Heap-Layers"
    system "cd src; make"

    lib.install "src/libhoard.dylib"
    
    (buildpath/"runner_script").write(runner_script)
    bin.install "runner_script" => "hoard"
  end
  
  def runner_script; <<-EOS
#!/usr/bin/env sh
DYLD_INSERT_LIBRARIES=#{lib}/libhoard.dylib "$@"
  EOS
  end

end
