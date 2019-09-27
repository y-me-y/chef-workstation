
if windows?
  dependency "git-windows"
else
  dependency "git-custom-bindir"
end

# For the Delivery build nodes
dependency "delivery-cli"
# This is a build-time dependency, so we won't leave it behind:
dependency "rust-uninstall"

# This internal component (source in components/gems)
# builds all gems that we ship with Workstation.
# No gems get shipped that are not declared in components/gems/Gemfile
dependency "gems"

dependency "gem-version-manifest"
dependency "gem-permissions"
dependency "rubygems-customization"
dependency "shebang-cleanup"

if windows?
  dependency "windows-env-customization"
  dependency "powershell-scripts"
end

dependency "version-manifest"
dependency "openssl-customization"

dependency "stunnel" if fips_mode?

# This *has* to be last, as it mutates the build environment and causes all
# compilations that use ./configure et all (the msys env) to break
if windows?
  dependency "ruby-windows-devkit"
  dependency "ruby-windows-devkit-bash"
  dependency "ruby-windows-system-libraries"
end

dependency "nodejs-binary"
dependency "chef-workstation-app"
dependency "uninstall-scripts"
dependency "ruby-cleanup"


# # # @afiune Experimental Go binary. (SPIKE https://github.com/chef/chef-workstation/issues/497)
# dependency "chef-analyze"
# # # @afiune This main wrapper will be our new 'chef' binary!
# dependency "main-chef-wrapper"
